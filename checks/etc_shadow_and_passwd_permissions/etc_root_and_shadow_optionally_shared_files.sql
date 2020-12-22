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
	f.path = '/etc/gshadow-'
	OR f.path = '/etc/gshadow'
);
-- This is only okay if 'root' is owner and group is either 'root' or 'shadow', and permissions are 0640 or more restrictive.
