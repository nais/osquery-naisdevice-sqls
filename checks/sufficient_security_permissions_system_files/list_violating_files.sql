SELECT
  e.path,
  u.username,
  g.groupname,
  e.recommended_mode,
  e.cis_recommendation,
  case when regex_match(f.mode, e.mode, 0) != "" then 0 else 1 end AS mode_match
FROM
  expected_files e
  JOIN file f USING(path)
  JOIN users u ON e.uid = u.uid
  JOIN groups g ON e.gid = g.gid
WHERE
  f.uid != e.uid OR
  f.gid != e.gid OR
  mode_match
;
