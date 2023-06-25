SELECT
	t.alias as protocol,
	l.port,
	p.cmdline,
	p.cwd,
	p.name,
	p.path as 'binary path'
FROM
	listening_ports l,
	processes p,
	etc_protocols t 
WHERE
	l.pid = p.pid 
	AND (
		p.name LIKE 'sshd'
		OR l.port = 22
		OR p.path LIKE 'sshd'
	) AND l.protocol = t.number;
