WITH
  human_accounts AS (
    SELECT
      username,
      directory,
      shell
    FROM
      users u
      WHERE
      u.uid >= 1000
      AND NOT
      ( -- These sub-expressions check if an account should be considered system-user
        u.shell IN ('/sbin/nologin', '/usr/sbin/nologin', '/usr/bin/false')
        AND u.directory IN ('/var/empty', '/nonexistent')
        AND (u.username LIKE 'nixbld%'
          OR u.username like 'snapd-range-%-root'
          OR u.username in ('nobody', 'snap_daemon')
        )
      )
  ),
  -- Start inspecting the gnome gsettings values
  user_gsettings_values AS (
    SELECT
      *
    FROM
      kolide_gsettings kg
    WHERE
      kg.username IN (
        SELECT
          username
        FROM
          human_accounts
      )
  ),
  -- Pivot the gsettings data from EAV to discrete columns
  screenlock_settings AS (
    select
      username,
      MAX(
        CASE
          WHEN key = 'ubuntu-lock-on-suspend' THEN value
        END
      ) AS will_lock_on_suspend,
      MAX(
        CASE
          WHEN key = 'lock-enabled' THEN value
        END
      ) AS automatic_screen_lock,
      MAX(
        CASE
          WHEN key = 'lock-delay' THEN CAST(SPLIT (value, " ", 1) AS int)
        END
      ) AS screen_lock_grace_period,
      MAX(
        CASE
          WHEN key = 'idle-delay' THEN CAST(SPLIT (value, " ", 1) AS int)
        END
      ) AS session_idle_delay
    FROM
      user_gsettings_values
    GROUP BY
      username
  ),
  -- Collect sway settings
  swayidle_settings AS (
    SELECT
      path AS swayidle_process_path,
      CAST(
        regex_match (cmdline, 'timeout (\d+) swaylock)', 1) AS INTEGER
      ) AS swaylock_timeout_seconds_regex_match,
      regex_match (cmdline, 'before-sleep swaylock', 0) AS swaylock_before_sleep_regex_match
    FROM
      processes
    WHERE
      name = 'swayidle'
  ),
  -- Merge the data using a left join from both the gsettings AND sway query outputs
  merge_data AS (
    SELECT
      CASE
        WHEN (
          will_lock_on_suspend = 'false'
          OR automatic_screen_lock = 'false'
          OR screen_lock_grace_period > 300
          OR session_idle_delay > 600
        ) THEN 'false'
        ELSE 'true'
      END AS gnome_screenlock_settings_secure,
      will_lock_on_suspend,
      automatic_screen_lock,
      screen_lock_grace_period,
      session_idle_delay,
      username,
      CASE
        WHEN (
          swaylock_timeout_seconds_regex_match > 600
          OR swaylock_before_sleep_regex_match != 'before-sleep swaylock'
        ) THEN 'false'
        WHEN swayidle_process_path IS NULL THEN 'false'
        ELSE 'true'
      END AS sway_screenlock_settings_secure,
      swayidle_process_path,
      swaylock_timeout_seconds_regex_match,
      swaylock_before_sleep_regex_match
    FROM
      screenlock_settings
      LEFT JOIN swayidle_settings
  ),
  sway_process AS (
    SELECT
      processes.path,
      hu.username AS user_name
    FROM
      processes
      LEFT JOIN human_accounts hu ON processes.cwd = hu.directory
    WHERE
      processes.name = 'sway'
  )
  -- Query for the existence of two failure cases
SELECT
  merge_data.*,
  human_accounts.*,
  sway_process.path AS sway_path,
  CASE
    WHEN (
      sway_process.path IS NOT NULL
      AND sway_screenlock_settings_secure = 'true'
    ) THEN 'PASS'
    WHEN (
      sway_process.path IS NULL
      AND gnome_screenlock_settings_secure = 'true'
    ) THEN 'PASS'
    ELSE 'FAIL'
  END AS KOLIDE_CHECK_STATUS
FROM
  merge_data
  LEFT JOIN sway_process ON merge_data.username = sway_process.user_name
  LEFT JOIN human_accounts ON merge_data.username = human_accounts.username
