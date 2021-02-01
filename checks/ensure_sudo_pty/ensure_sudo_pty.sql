WITH
	ensure_no_use_pty_exceptions
AS (
	SELECT
		count(*) AS pty_exception_counts
	FROM
		sudoers
	WHERE
		rule_details LIKE '!use_pty%'
), ensure_use_pty_is_default
AS (
    SELECT
		COUNT(*) AS uses_pty_counts
	FROM
		sudoers
	WHERE
		rule_details = 'use_pty'
	AND
		header = 'Defaults'
)
SELECT
	*
FROM
	ensure_no_use_pty_exceptions, ensure_use_pty_is_default
WHERE
	uses_pty_counts != 1
OR
	pty_exception_counts != 0;
