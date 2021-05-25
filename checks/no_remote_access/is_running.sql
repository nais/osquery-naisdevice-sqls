WITH main_network_namespace AS (
	SELECT net_namespace
	FROM process_namespaces
	WHERE pid = 1
)

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
		l.net_namespace IN (SELECT * FROM main_network_namespace)
		AND l.address NOT IN ('127.0.0.1', '::1')
		AND l.port IN (5800, 5900)
		OR p.name IN (
			'directvnc'
			,'krfb'
			,'linuxvnc'
			,'teamviewerd'
			,'tigeervnc'
			,'tightvnc'
			,'tightvncserver'
			,'vino'
			,'x11vnc'
			,'xrdp'
			,'xserver-xephyr'
		) OR p.path IN (
			'directvnc'
			,'krfb'
			,'linuxvnc'
			,'teamviewerd'
			,'tigeervnc'
			,'tightvnc'
			,'tightvncserver'
			,'vino'
			,'x11vnc'
			,'xrdp'
			,'xserver-xephyr'
		)
	) AND l.protocol = t.number;
