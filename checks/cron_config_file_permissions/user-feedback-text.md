# Failing Check: File permissions on crontab files
Reason: Cron-jobs have insecure file permissions.

## Why is this a Problem?
Cron/crontab executes as `root` unless otherwise configured.
Hence, a malicious user with write-permissions to the files/folders may execute jobs as `root` on system.

## Required Action
1. Use `sudo chown root:root <file or folder>` to set correct ownership on `<file or folder>`.
2. Use `sudo chmod <permission bits - e.g. 0600> <file or folder>` to set correct permission bits on `<file or folder>`.
