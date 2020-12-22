SELECT
	u.username as 'owner',
	g.groupname as 'group',
	f.mode as 'permission octals',
	f.path
FROM
	file f,
	groups g,
	users u
WHERE
	f.path = '/etc/passwd-';
-- This is only okay if root is both owner and group, and permissions are 0600 or more restrictive
