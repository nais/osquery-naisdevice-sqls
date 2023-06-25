# Failing Check: Lockscreen timeout not configured for Sway Desktop Environment
Reason: Unable to find acceptable timeout for `swaylock` in `swayidle`'s running process' command line.

## Why is this a problem?
naisdevice policy ([Do's & Don'ts](https://naisdevice-approval.nais.io/)) requires an automatic screen lock timeout be activated to hinder unwarranted access to your nais device.
This needs to be activated and active at any given time, so that it's not forgotten the hypothetically _one_ time you work at a Café and forget to lock the PC.

## Required Action
1. Ensure `swayidle` is executed at login into Sway, with a timeout of maximum 10 minutes.

### Example configuration
`~/.config/sway/config`:
```
(...)
### Idle configuration
set $swaylock swaylock --config ~/.config/sway/swaylock.conf
exec swayidle -w \
        timeout 15 'pgrep --exact swaylock && swaymsg "output * dpms off"' \
                resume 'swaymsg "output * dpms on"' \
        timeout 660 'swaymsg "output * dpms off"' \
                resume 'swaymsg "output * dpms on"' \
        timeout 600 "$swaylock" \
        before-sleep "$swaylock" \
        after-resume 'swaymsg "output * dpms on"'
# This will lock your screen after 600 seconds of inactivity, then turn off your displays after another 60 seconds, and turn your screens back on when resumed.
# It will also lock your screen before your computer goes to sleep.
#
# If your computer is idle for 15 seconds and a 'swaylock' process is running, the screen is turned off.
(...)
```
