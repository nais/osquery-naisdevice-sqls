WITH
	sudoers_items
AS (
	SELECT
		count(*) AS item_count
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
	sudoers_items
WHERE
	item_count != 1;
