# osquery naisdevice SQLs

## Table of Services we want to check for with kolide/osquery
| Kolide Check name	| Type		| Description | Linux Equivalents |
| :---------------- | :------:| :---------- | ----------------: |
| file\_sharing			| INTEGER | 1 If file sharing is enabled else 0 | SAMBA/SMB protocol/NFS (`netstat -atulpn \| grep LISTEN \| lsof`) |
| printer\_sharing	| INTEGER	| 1 If printer sharing is enabled else 0 |	Denne vanskeligst å sjekke (selv om den er veldefinert) |
| internet\_sharing	| INTEGER	| 1 If internet sharing is enabled else 0 |	Sikre at nettverkskort ikke brukes som aksesspunkt/DHCP. |
| bluetooth\_sharing| INTEGER	| 1 If bluetooth sharing is enabled for any user else 0 |	Utfordrende å sjekke? |

## Table of Services we've implemented checks for with kolide/osquery
| Kolide Check name	| Type		| Description | Linux Equivalents |
| :---------------- | :------:| :---------- | ----------------: |
| remote\_management| INTEGER	| 1 If remote management is enabled else 0 |	SSH/telnet/VNC |


## Testing queries locally

If you have Kolide installed on your machine (which you probably have), you can run queries locally to test them!

Adjust paths to `osqueryd` and `tables.ext` as necessary.
When you start, you get a prompt.
A few seconds later, you will get messages about the kolide tables being loaded from the extension.
You can now run all the same queries as Kolide can.

### Requirements
In order to have access to all the tables Kolide provides, you need:
1. The `tables.ext` extension - which you can download from [this message](https://nav-it.slack.com/archives/C010NG02FEU/p1611069424010100?thread_ts=1611069093.009800&cid=C010NG02FEU) in the [#kolide-nav](https://nav-it.slack.com/archives/C010NG02FEU) Slackchannel.
    - PS: You can also build `tables.ext` yourself by checking out https://github.com/kolide/launcher and running `make build_tables.ext`.
2. Find out where Kolide has installed the `osqueryd` binary, on my linux machine it is at `/usr/local/kolide-k2/bin/osqueryd`.

With those requirements out of the way, to run queries with the kolide-added tables - adapt this command ([tips here](https://github.com/nais/osquery-naisdevice-sqls/#testing-queries-locally)) to your machine:
```
sudo osqueryd -S --verbose --allow-unsafe --extension tables.ext
```
