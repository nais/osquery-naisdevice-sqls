# Failing Check: File permissions on /etc/{passwd,shadow,group} files
Reason: Critical /etc/ files have insecure access permissions/ownership.

## Why is this a Problem?
- Rouge/malicious/unnecessary agents may replace, remove, and set passwords of accounts.
- Rouge/malicious/unnecessary agents may replace, remove, and set login (like `bash` instead of `nologin`) of accounts.
- Rouge/malicious/unnecessary agents may replace, remove, and modify groups (like add unauthorized user to `sudo` group).

## Required Action
- Use `sudo chmod <permission bits> <file>` to set permission octals according to below table.
- Use `sudo chown <owner>:<group> <file>` to set ownership of file according to below table.

| file | owner | group | permission octals|
|------|-------|-------|------------------|
| /etc/group     | `root` | `root`   | 0644 |
| /etc/group-    | `root` | `root`   | 0644 |
| /etc/passwd    | `root` | `root`   | 0644 |
| /etc/passwd-   | `root` | `root`   | 0600 |
| /etc/shadow    | `root` | `shadow` | 0644 |
| /etc/shadow-   | `root` | `shadow` | 0644 |
| /etc/gshadow   | `root` | `shadow` or `root` | 0640 |
| /etc/gshadow-  | `root` | `shadow` or `root` | 0640 |

