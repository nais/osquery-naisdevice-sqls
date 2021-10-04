# Failing Check: Packet redirect sending is disabled
Reason: Packet redirect sending is disabled

## Why is this a Problem?
ICMP Redirects are used to send routing information to other hosts. As a host itself does not act as a router (in a host only configuration), there is no need to send redirects.

An attacker could use a compromised host to send invalid ICMP redirects to other router devices in an attempt to corrupt routing and have users access a system set up by the attacker as opposed to a valid system.

Further reading can be found at CIS Ubuntu 18.04 Benchmark v3.1, section 3.1.1.

## Required Action
1. Turn off packet redirects in the active kernel:
    ```
    sudo sysctl -w net.ipv4.conf.all.send_redirects=0
    sudo sysctl -w net.ipv4.conf.default.send_redirects=0
    sudo sysctl -w net.ipv4.route.flush=1
    ```
2. Create a file named `/etc/sysctl.d/10-disable-send-redirects.conf` with the following contents:
    ```
    net.ipv4.conf.all.send_redirects=0
    net.ipv4.conf.default.send_redirects=0
    ```
3. Click "I fixed it. Check again", to confirm the issue is resolved - once it's removed.
