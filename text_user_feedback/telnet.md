# Failing Check: Telnet Server Enabled
Reason: Telnet Server

## Why is this a Problem?
Telnet lets users of other computers access your computer using SSH and SFTP.
This could lead to unwanted situations where an outside agent has access to your device.
naisdevice policy ([Do's & Don'ts](https://naisdevice-approval.nais.io/)) state that this is unwanted functionality in our environment.

## Required Action:
1. Stop the SSH server with the equivalent of:
   `sudo systemctl stop inetd.service`
2. Uninstall the SSH server with the equivalent of:
   `sudo apt remove telnetd`
3. Click "I fixed it. Check again", to confirm the issue is resolved - once it's removed.

For more info please refer to the oracle that is the interwebs: telnetd
