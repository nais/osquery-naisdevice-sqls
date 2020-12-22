SELECT
	mode as 'permission octals',
	path
FROM
	file
WHERE
	type = 'directory'
	AND path like '/var/log/%%';
-- This is only okay if permissions match regex: "\d{1,2}[0145]0"
