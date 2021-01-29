WITH
	sudoers_items
AS (
	SELECT
		count(*) AS item_count
	FROM
		sudoers
	WHERE
		COUNT(regex_match(cmdline, 'timeout (\d+) swaylock)', 1)
		rule_details  'use_pty'
)
SELECT
	*
FROM
	sudoers_items
WHERE
	item_count != 1;
