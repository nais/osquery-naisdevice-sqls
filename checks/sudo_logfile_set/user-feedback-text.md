# Failing Check: `sudo` does not log usage correctly!
## Rationale
`sudo` is a great tool supporting the "principle of least privilege" security axiom, and is a mandated requirement for `naisdevice`.
Thus, it's a security benefit to be able to retrospectively check which commands have been executed through the use of sudo.

Hence:

1. the logfile must be adequately protected from erroneous edits/writes,
2. `sudo` itself must be configured to log commands, but not their (potentially sensitive) outputs.

## Why is this a problem?
This addresses: CIS Ubuntu 18.04 Benchmark v2.0.1, section 1.3.3.

## Required Action
1. Add the following to your `sudo` settings - hint: open up a `sudo`-safe editing environment with `sudo visudo`:
    - ```
    Defaults	logfile="/var/log/auth.log"
    Defaults	log_output
    Defaults!	/usr/bin/sudoreplay !log_output
    ```
2. Delete any other lines containing `log\*` from any files that recursively match the path: `/etc/sudoers*`.
