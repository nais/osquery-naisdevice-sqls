/*
  Ensure `/etc/cron.deny` and `/etc/at.deny` do not exist:
*/
SELECT path, uid, gid, mode, (path = "") as happy_total FROM file WHERE path in
(
  '/etc/at.deny',
  '/etc/cron.deny'
);
