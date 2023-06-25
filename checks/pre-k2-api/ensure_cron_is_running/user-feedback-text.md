# Failing Check: Ensure cron running
Reason: cron service is not running.

## Why is this a Problem?
Cron is a system service utilized by both security-minded software, and those not aimed at maintaining security.
It allows asynchronous (and time gated) execution of (background & foreground) jobs on the system, like firewall updates/security patching.

This addresses: CIS Ubuntu 18.04 Benchmark v2.0.1, section 5.1.1.

## Required Action
1. `sudo systemctl enable --now cron.service`
