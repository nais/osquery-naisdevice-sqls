WITH
cis_perms (cis_id,path,mode_req,uid_req,gid_req_1,gid_req_2) AS (VALUES
('1.5.1','/boot/grub/grub.cfg','0644','0','root',''),
('1.8.1.4','/etc/motd','0644','0','root',''),
('1.8.1.5','/etc/issue','0644','0','root',''),
('1.8.1.6','/etc/issue.net','0644','0','root',''),
('3.3.2','/etc/hosts.allow','0644','0','root',''),
('3.3.3','/etc/hosts.deny','0644','0','root',''),
('5.1.2','/etc/crontab','0644','0','root',''),
('5.1.3','/etc/cron.hourly','0755','0','root',''),
('5.1.4','/etc/cron.daily','0755','0','root',''),
('5.1.5','/etc/cron.weekly','0755','0','root',''),
('5.1.6','/etc/cron.monthly','0755','0','root',''),
('5.1.7','/etc/cron.d','0755','0','root',''),
('5.1.8','/etc/cron.allow','0644','0','root',''),
('5.1.8','/etc/at.allow','0644','0','root',''),
('6.1.2','/etc/passwd','0644','0','root',''),
('6.1.3','/etc/gshadow-','0640','0','root','shadow'),
('6.1.4','/etc/shadow','0640','0','root','shadow'),
('6.1.5','/etc/group','0644','0','root',''),
('6.1.6','/etc/passwd-','0644','0','root',''),
('6.1.7','/etc/shadow-','0640','0','root','shadow'),
('6.1.8','/etc/group-','0644','0','root',''),
('6.1.9','/etc/gshadow','0640','0','root','shadow')
),
groups_temp AS (select groupname, gid from  groups where groupname IN (select distinct gid_req_1 from cis_perms UNION select distinct gid_req_2 from cis_perms)),
merge_data AS (
  SELECT cis.*, f.mode, f.uid, f.gid, f.mtime, f.type FROM cis_perms cis LEFT JOIN file f USING(path)),
mode_split AS (
  SELECT *,
  SUBSTR(mode, -3, 1) AS pos_u,
  SUBSTR(mode, -2, 1) AS pos_g,
  SUBSTR(mode, -1, 1) AS pos_w,
  SUBSTR(mode_req, -3, 1) AS pos_u_req,
  SUBSTR(mode_req, -2, 1) AS pos_g_req,
  SUBSTR(mode_req, -1, 1) AS pos_w_req
  FROM merge_data WHERE mode != mode_req OR uid != uid_req OR gid NOT IN (gid_req_1,gid_req_2)),
bit_split AS (
SELECT *,
  (pos_u >> 1) & 1 AS u_r,
  (pos_u >> 2) & 1 AS u_w,
  (pos_u >> 3) & 1 AS u_x,
  (pos_g >> 1) & 1 AS g_r,
  (pos_g >> 2) & 1 AS g_w,
  (pos_g >> 3) & 1 AS g_x,
  (pos_w >> 1) & 1 AS w_r,
  (pos_w >> 2) & 1 AS w_w,
  (pos_w >> 3) & 1 AS w_x,
  (pos_u_req >> 1) & 1 AS u_r_req,
  (pos_u_req >> 2) & 1 AS u_w_req,
  (pos_u_req >> 3) & 1 AS u_x_req,
  (pos_g_req >> 1) & 1 AS g_r_req,
  (pos_g_req >> 2) & 1 AS g_w_req,
  (pos_g_req >> 3) & 1 AS g_x_req,
  (pos_w_req >> 1) & 1 AS w_r_req,
  (pos_w_req >> 2) & 1 AS w_w_req,
  (pos_w_req >> 3) & 1 AS w_x_req
 FROM mode_split
 JOIN groups_temp USING(gid)),
excessive_permissions AS (
  SELECT * FROM bit_split
  WHERE u_r > u_r_req
    OR u_w > u_w_req
    OR u_x > u_x_req
    OR g_r > g_r_req
    OR g_w > g_w_req
    OR g_x > g_x_req
    OR w_r > w_r_req
    OR w_w > w_w_req
    OR w_x > w_x_req
    OR groupname NOT IN (gid_req_1,gid_req_2)
    OR uid != uid_req)
SELECT path, mtime, mode, mode_req, uid, uid_req, gid, groupname, gid_req_1, gid_req_2, cis_id FROM excessive_permissions;
