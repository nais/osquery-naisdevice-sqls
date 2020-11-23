SELECT
	*
FROM
	deb_packages
WHERE
	name IN (
		'vino'
		,'x11vnc'
		,'krfb'
		,'tightvncserver'
		,'tigervnc'
		,'directvnc'
		,'linuxvnc'
		,'xrdp'
		,'xserver-xephyr'
);
