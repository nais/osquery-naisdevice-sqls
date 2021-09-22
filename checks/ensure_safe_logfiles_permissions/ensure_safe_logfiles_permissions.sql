SELECT
	--f.path,
	--u.username AS file_owner,
	--g.groupname AS group_owner,
	f.mode AS permission_bits,
	COUNT(*)
FROM file f
	LEFT JOIN users u ON f.uid == u.uid
	LEFT JOIN groups g ON f.gid == g.gid
WHERE
	f.type == 'regular'
AND
	f.path LIKE '/var/log/%%'
AND NOT (
	permission_bits == '0640'
	OR permission_bits == '0600'
) GROUP BY
	permission_bits;
