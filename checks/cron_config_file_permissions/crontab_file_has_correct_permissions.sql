SELECT
	u.username as 'owner',
	g.groupname as 'group',
	f.mode as 'permission octals',
	f.path as path
FROM
	users u,
	groups g,
	file f
WHERE
	(
		f.path = '/etc/crontab'
		AND f.uid = u.uid AND f.gid = g.gid
	);
-- This is only okay if user=root, group=root, and permissions are 0600
