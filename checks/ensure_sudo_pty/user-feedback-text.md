# Failing Check: Insecure sudoers configuration
Reason: Inadequately secure configuration of sudoers

## Why is this a Problem?

naisdevice policy ([Do's & Don'ts](https://naisdevice-approval.nais.io/)) states that ensuring the device is secure is the responsibility of the user.

Further reading can be found at CIS Ubuntu 18.04 Benchmark v2.0.1, section 1.3.

## Required Action
1. `sudo visudo`.
2. Add the following to an empty line: `Defaults use_pty`.
3. Save and exit.
4. Remove all lines including the substring `!use_pty` from all files recursively in `/etc/sudoers*`.
