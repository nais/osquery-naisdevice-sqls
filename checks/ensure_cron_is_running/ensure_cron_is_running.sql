SELECT
	id, sub_state, load_state, active_state, fragment_path
FROM
	systemd_units
WHERE NOT (
		load_state == 'loaded'
	AND
		active_state == 'active'
	AND
		sub_state == 'running'
) AND
	id == 'cron.service'
;

