WITH
  user_login_shells
AS (
  SELECT uid, username, shell
  FROM users
  WHERE 
    username NOT IN ('root', 'sync')
    AND uid != 1000
    AND shell NOT LIKE '%/nologin'
    AND shell != '/bin/false'
)
SELECT
  *
FROM
  user_login_shells;