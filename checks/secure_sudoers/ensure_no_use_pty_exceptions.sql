WITH
	sudoers_items
AS (
	SELECT
		count(*) AS item_count
	FROM
		sudoers
	WHERE
		rule_details LIKE '!use_pty%'
)
SELECT
	*
FROM
	sudoers_items
WHERE
	item_count != 0;
