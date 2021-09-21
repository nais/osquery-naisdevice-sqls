WITH
    aslr_enabled
AS (
    SELECT
        COUNT(*) AS aslr_enabled_counts
    FROM system_controls
    WHERE
        name == 'kernel.randomize_va_space'
    AND
        current_value == 2
)
SELECT
    *
FROM aslr_enabled
    WHERE aslr_enabled_counts != 1;