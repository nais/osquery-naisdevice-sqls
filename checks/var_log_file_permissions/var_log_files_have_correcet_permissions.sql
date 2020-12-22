SELECT
	mode as 'permission octals',
	path
FROM
	file
WHERE
	type = 'regular'
	AND path like '/var/log/%%';
-- This is only okay if permissions match regex: "\d{1,2}[04]0"
