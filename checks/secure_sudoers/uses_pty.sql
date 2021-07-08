WITH
	sudoers_items
AS (
	SELECT
		COUNT(regex_match(rule_details, '(?:.+,)*!use_pty(?:,.*)*', 0)) as disallowed_pty_counts,
		COUNT(SELECT * FROM sudoers WHERE rule_details = 'use_pty') as uses_pty_counts
	FROM
		sudoers
)
SELECT
	*
FROM
	sudoers_items
WHERE
	uses_pty_counts != 1
OR
	disallowed_pty_counts != 0;
