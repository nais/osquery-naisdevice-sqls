WITH
	root_shell
AS (
	SELECT
		shell
	FROM users
	WHERE 
		uid = 0
)
SELECT
	COUNT(*)
FROM
	shadow
WHERE
	username == 'root'
AND
	password_status != 'active';
