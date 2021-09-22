SELECT
	username, password_status
FROM
	shadow
WHERE NOT (
	password_status == 'active'
) AND
	username == 'root';
