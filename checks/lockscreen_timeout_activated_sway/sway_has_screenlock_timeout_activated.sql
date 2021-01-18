SELECT
  CAST(regex_match(cmdline, 'timeout (\d+) swaylock)', 1) as INTEGER) as swaylock_timeout_seconds_regex_match,
  regex_match(cmdline, 'before-sleep swaylock', 0) as swaylock_before_sleep_regex_match
FROM
  processes
WHERE (
  name = 'swayidle'
AND
  swaylock_timeout_seconds_regex_match <= 600
  and swaylock_before_sleep_regex_match = 'before-sleep swaylock'
);
