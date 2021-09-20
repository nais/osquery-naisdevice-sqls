WITH
	log_files
AS (
	SELECT
		COUNT(*) AS secured_sudo_logfile
	FROM file
	WHERE 
		path = '/var/log/auth.log'
	AND
		uid == 0
	AND
		gid == 0
), sudoers_settings
AS (
	SELECT
		COUNT(*) as sudoers_logfile
	from sudoers
	WHERE
		header == 'Defaults'
	AND
		rule_details == 'logfile="/var/log/auth.log"'
)
SELECT
	*
FROM
	log_files, sudoers_settings
WHERE
	sudoers_logfile != 1
AND
	secured_sudo_logfile != 1;
