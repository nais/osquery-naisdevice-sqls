# Failing Check: Lockscreen timeout not configured for xscreensaver
Reason: `~/.xscreensaver` does not contain necessary lock and lockTimeout settings, or xscreensaver is not running

## Why is this a problem?
naisdevice policy ([Do's & Don'ts](https://naisdevice-approval.nais.io/)) requires an automatic screen lock timeout be activated to hinder unwarranted access to your nais device.
This needs to be activated and active at any given time, so that it's not forgotten the hypothetically _one_ time you work at a Café and forget to lock the PC.

xscreensaver blanks the screen after `timeout` minutes, and then locks it `lockTimeout` minutes after that. The sum of these settings should be less than 10 minutes. 

## Required Action
1. Ensure `xscreensaver` is executed at login, with a timeout of maximum 10 minutes, and configured to lock the screen.

### Example configuration
`~/.xscreensaver`:
```
(...)
timeout:    0:04:00
lock:		True
lockTimeout:	0:01:00
(...)
```
