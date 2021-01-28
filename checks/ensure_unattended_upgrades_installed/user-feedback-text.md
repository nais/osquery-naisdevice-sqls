# Failing Check: Unattended-upgrades not installed
Reason: Automatic installation of security updates

## Why is this a Problem?
The 'unattended-upgrades' package installes package updates marked as security improvements automatically in the background for you.
Thus ensuring that you as a user don't forget to install potentially critical security updates offered through your package manager.

naisdevice policy ([Do's & Don'ts](https://naisdevice-approval.nais.io/)) states that ensuring the device is secure is the responsibility of the user.
`unattended-upgrades` will help ease that responsibility for you.

## Required Action
1. `sudo apt[-get] install unattended-upgrades`
2. Click "I fixed it. Check again", to confirm the issue is resolved - once it's removed.
