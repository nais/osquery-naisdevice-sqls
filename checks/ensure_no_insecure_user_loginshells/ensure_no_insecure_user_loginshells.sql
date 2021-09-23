SELECT
	uid, username, shell
FROM
	users
WHERE NOT (
		shell == '/usr/sbin/nologin'
	OR
		shell == '/bin/false'
) AND NOT (
		username IN ('root', 'sync')
	OR
		-- Default actually logged-in-user's id is 1000 on debian/ubuntu
		uid == 1000
);
