SELECT
	u.uid, u.username, s.password_status, u.shell
FROM
	users u, shadow s
WHERE 
	s.username == u.username
AND NOT (
		u.shell == '/usr/sbin/nologin'
	OR
		u.shell == '/bin/false'
	OR
		u.username == 'sync'
) AND NOT (
	s.password_status IN ('active', 'locked')
);
