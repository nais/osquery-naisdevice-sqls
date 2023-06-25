WITH
	ensure_use_pty_is_default
AS (
	SELECT
		COUNT(*) AS pty_is_default_for_all
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
	ensure_use_pty_is_default e, sudoers s
WHERE NOT (
	e.pty_is_default_for_all == 1
) OR
	s.rule_details LIKE '!use_pty';
