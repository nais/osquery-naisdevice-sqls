# Failing Check: File permissions on /var/log/\* files
Reason: Logfiles have insecure access permissions.

## Why is this a Problem?
Sensitive information/logs may be leaked to rouge/malicious/unnecessary processes/users on system.

## Required Action
- Use `sudo chmod g-wx,o-wrx <file path>` to set correct permission bits on `<file>`.
- Use `sudo chmod g-w,o-wrx <folder path>` to set correct permission bits on `<folder>`.
- Or use `find /var/log -type f -exec chmod g-wx,o-rwx "{}" + -o -type d -exec chmod g-w,o-rwx "{}" +` to recursively set the above for all files and folders within `/var/log`.
