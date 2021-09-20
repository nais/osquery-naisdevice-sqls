# Failing Check: root user doesn't have a password set!
## Rationale
Manually setting a secure password for the `root` account stops many attack vectors on a \*nix system.

## Why is this a problem?
This can (e.g.) allow login as `root` for unintended users of system, e.g. when using TPM to encrypt drive and laptop is booted by third-party (presumably while unattended).

This addresses: CIS Ubuntu 18.04 Benchmark v2.0.1, section 1.3.

## Required Action
Set password for your `root` user.
1. Execute this interactive command in a terminal: `sudo passwd root`

