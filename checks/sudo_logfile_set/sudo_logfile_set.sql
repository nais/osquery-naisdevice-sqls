WITH
	log_files
AS (
	SELECT
		COUNT(*) as secured_sudo_logfile
	FROM file
	WHERE
		path == (SELECT regex_match(rule_details, '^logfile="(.+)"$', 1) as details from sudoers where details IS NOT NULL)
	AND
		uid == (SELECT uid FROM users WHERE username == 'syslog')
	AND
		gid == (SELECT gid FROM groups WHERE groupname == 'adm')
	AND 
		mode == '0640'
), log_outputs
AS (
	SELECT
		COUNT(*) AS log_output_counts
	FROM sudoers
	WHERE
		header == 'Defaults'
	AND
		rule_details == 'log_output'
), log_output_restrictions
AS (
	SELECT
		COUNT(DISTINCT regex_match(rule_details, '.+bin/sudoreplay .*!log_output', 0)) AS allowlisted_counts
	FROM sudoers
), ensure_no_logging_disabled
AS (
	SELECT 
		COUNT(DISTINCT rule_details) AS log_disabled_counts
	FROM sudoers
	WHERE rule_details like "%!log%"
)
SELECT
	*
FROM
	log_files, log_outputs, log_output_restrictions, ensure_no_logging_disabled
WHERE
	NOT (
		secured_sudo_logfile == 1
		AND
		log_output_counts == 1
		AND
		allowlisted_counts == 1
		AND
		log_disabled_counts == allowlisted_counts
	);
