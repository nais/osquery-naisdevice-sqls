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

If you have Kolide installed on your machine (which you probably have), you can run queries locally to test them. In order to have access
to all the tables Kolide provides, you also need the `tables.ext` extension. This can be obtained in the #kolide-nav channel on Slack, or
simply by checking out https://github.com/kolide/launcher and running `make build_tables.ext`.

Find out where Kolide has installed the `osqueryd` binary, on my linux machine it is at `/usr/local/kolide-k2/bin/osqueryd`.

To run queries, use this command:

    sudo osqueryd -S --verbose --allow-unsafe --extension tables.ext

Adjust paths to `osqueryd` and `tables.ext` as necessary. When you start, you get a prompt. A few seconds later, you will get messages
about the kolide tables being loaded from the extension. You can now run all the same queries as Kolide can.
