SELECT
  e.path as file_path,
  f.uid as file_uid,
  e.uid as expected_uid,
  f.uid || case when f.uid = e.uid then ' = ' else ' != ' end || e.uid as uid_match,
  f.gid as file_gid,
  e.gid as expected_gid,
  f.gid || case when f.gid = e.gid then ' = ' else ' != ' end || e.gid as gid_match,
  f.mode as file_mode,
  e.mode as expected_mode_re,
  f.mode || case when regex_match(f.mode, e.mode, 0) != "" then ' = ' else ' != ' end || e.mode as mode_match
FROM
  expected_files e
  LEFT JOIN file f USING(path)
;
