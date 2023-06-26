# Failing Check: ufw installed
Reason: ufw is not installed

## Why is this a Problem?
A Firewall package is required for firewall management and configuration.

A sensible default firewall configuration is required in order to protect the device from unwanted incoming connections.

This addresses: CIS Ubuntu 18.04 Benchmark v2.0.1, section 3.5.1.

## Required Action

1. Install ufw: `sudo apt install ufw`.
2. Click "I fixed it. Check again", to confirm the issue is resolved - once it's removed.