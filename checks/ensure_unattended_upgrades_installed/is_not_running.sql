WITH unattended_startup_items  AS (
	SELECT
		count(*) as item_count
	FROM startup_items
	WHERE
		name LIKE 'unattended-upgrades'
	AND
		status = 'enabled'
	AND
		path = '/etc/init.d/unattended-upgrades'

)
SELECT * FROM unattended_startup_items where item_count != 1;
