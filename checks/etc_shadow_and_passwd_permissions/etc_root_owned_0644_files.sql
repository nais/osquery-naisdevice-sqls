SELECT
	u.username as 'owner',
	g.groupname as 'group',
	f.mode as 'permission octals',
	f.path
FROM
	file f,
	groups g,
	users u
WHERE (
	f.path = '/etc/passwd'
	OR f.path = '/etc/group'
	OR f.path = '/etc/group-'
);
-- This is only okay if root is both owner and group, and permissions are 0644 or more restrictive
