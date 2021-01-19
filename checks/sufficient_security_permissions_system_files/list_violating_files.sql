SELECT
  e.path as file_path,
  f.uid || case when f.uid = e.uid then ' = ' else ' != ' end || e.uid as uid_match,
  f.gid || case when f.gid = e.gid then ' = ' else ' != ' end || e.gid as gid_match,
  f.mode || case when regex_match(f.mode, e.mode, 0) != "" then ' = ' else ' != ' end || e.mode as mode_match
FROM
  expected_files e
  JOIN file f USING(path)
WHERE
  uid_match like '%!=%' or
  gid_match like '%!=%' or
  mode_match like '%!=%'
;

/*
  Example output when wrong mode:
  +-----------------+-----------+-----------+--------------------------+
  | file_path       | uid_match | gid_match | mode_match               |
  +-----------------+-----------+-----------+--------------------------+
  | /etc/cron.allow | 0 = 0     | 0 = 0     | 0644 != 0[0-6][0-4][0-0] |
  +-----------------+-----------+-----------+--------------------------+
*/
