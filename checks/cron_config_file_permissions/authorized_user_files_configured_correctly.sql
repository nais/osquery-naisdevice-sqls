SELECT
	u.username as user,
	g.groupname as group,
	f.path as path,
	f.mode as permission_bits
FROM
	users u,
	groups g,
	file f
WHERE
	(
		f.path = '/etc/cron.allow'
		OR f.path = '/etc/at.allow'
	) AND f.uid = u.uid AND f.gid = g.gid;
-- This is only okay if user=root, group=root, and permissions are 0640
