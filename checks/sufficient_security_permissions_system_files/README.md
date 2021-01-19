To test:
`osqueryi < <(cat expected_files.sql list_all_files.sql)`
`osqueryi < <(cat expected_files.sql list_violating_files.sql)`
`osqueryi < absent_files.sql`
