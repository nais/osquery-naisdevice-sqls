# osquery Naisdevice SQLs

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
