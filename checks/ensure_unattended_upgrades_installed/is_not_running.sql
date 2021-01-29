WITH unattended_startup_items  AS (
	SELECT
		count(*) as item_count
	FROM startup_items
	WHERE
		name LIKE 'unattended-upgrades%'
	AND (
		status = 'enabled'
		OR status = 'active'
	)
)
SELECT * FROM unattended_startup_items where item_count != 2;
