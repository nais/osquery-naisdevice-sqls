WITH
	systemd_job
AS (
	SELECT
		COUNT(*) AS systemd_query_results
	FROM
		systemd_units
	WHERE
		id == 'unattended-upgrades.service'
	AND
		sub_state == 'running'
	AND
		active_state == 'active'
) SELECT
	*
FROM
	systemd_job
WHERE NOT (
	systemd_query_results == 1
);
