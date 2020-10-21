SELECT
	*
FROM
	deb_packages
WHERE
	name IN (
		'openssh-server'
		,'telnet-server'
		,'vino'
		,'x11vnc'
		,'krfb'
		,'tightvncserver'
		,'tigervnc'
		,'directvnc'
		,'linuxvnc'
		,'xrdp'
		,'xserver-xephyr'
);
