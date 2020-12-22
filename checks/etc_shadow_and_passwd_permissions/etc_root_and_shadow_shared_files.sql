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
	f.path = '/etc/shadow-'
	OR f.path = '/etc/shadow'
);
-- This is only okay if 'root' is owner and group is 'shadow', and permissions are 0640 or more restrictive.
