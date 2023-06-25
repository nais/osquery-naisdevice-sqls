# Failing Check: RDP/VNC Enabled
Reason: Remote Desktop Protocol 

## Why is this a Problem?
'Remote Desktop' capabilities exposes your machine to malicious activity, depending on level of patch, network location and protocol implementation.
This could lead to unwanted situations where an attacker "is watching your every move".
naisdevice policy ([Do's & Don'ts](https://naisdevice-approval.nais.io/)) state that this is unwanted functionality in our environment. 

## Required Action
1. To disable RDP/VNC `${program match}` simply stop it, and uninstall/remove it.
2. Click "I fixed it. Check again", to confirm the issue is resolved - once it's removed.

For more info please refer to the oracle that is the interwebs: `${program match}`
