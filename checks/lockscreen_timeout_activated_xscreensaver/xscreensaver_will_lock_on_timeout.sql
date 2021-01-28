WITH xscreensaver_config AS (
    SELECT
        MAX(CASE WHEN key = 'lock' THEN value END) as lock_enabled,
        MAX(CASE WHEN key = 'lockTimeout' THEN
                (CASE WHEN length(value) < 8 THEN "0" || value ELSE value END)
            END) as lock_timeout,
        MAX(CASE WHEN key = 'timeout' THEN
                (CASE WHEN length(value) < 8 THEN "0" || value ELSE value END)
            END) as blank_timeout
    FROM
        kolide_ini
    WHERE
        path LIKE "/home/%/.xscreensaver"
)

SELECT
    lock_enabled,
    lock_timeout,
    strftime("%s", lock_timeout) - strftime("%s", "00:00:00") AS lock_timeout_seconds,
    blank_timeout,
    strftime("%s", blank_timeout) - strftime("%s", "00:00:00") AS blank_timeout_seconds
FROM
    xscreensaver_config
WHERE
    lock_enabled != 'true'
OR
    lock_timeout_seconds + blank_timeout_seconds > 600
;
