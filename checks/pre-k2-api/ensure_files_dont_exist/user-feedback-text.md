# Failing Check: Dangerous system files
Reason: The existence of these system files allow for unsafe control mechanisms that expose your system for potential security risks.

## Why is this a problem?
These files enable a control mechanism which we do not condone you to employ as a naisdevice user.
Further reading can be found at CIS Ubuntu 18.04 Benchmark v2.0.1, section 5.1.8.

## Required Action
`sudo rm -f /etc/at.deny /etc/cron.deny`
