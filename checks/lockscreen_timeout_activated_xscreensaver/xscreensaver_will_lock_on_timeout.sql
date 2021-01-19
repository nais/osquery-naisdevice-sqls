WITH xscreensaver_config AS (
    SELECT
        MAX(CASE WHEN key = 'lock' THEN value END) as lock_enabled,
        MAX(CASE WHEN key = 'lockTimeout' THEN
                (CASE WHEN length(value) < 8 THEN "0" || value ELSE value END)
            END) as lock_timeout
    FROM
        kolide_ini
    WHERE
        path LIKE "/home/%/.xscreensaver"
)

SELECT
    lock_enabled,
    lock_timeout
FROM
    xscreensaver_config
WHERE
    lock_enabled = 'true'
AND
    time(lock_timeout) <= time("00:10:00")
;
