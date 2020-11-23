SELECT
	*
FROM
	rpm_packages
WHERE
	name IN (
		'vnc-server'
		,'x11vnc'
		,'teamviewer'
		,'x2go'
		,'krfb'
		,'tightvncserver'
		,'tigervnc'
		,'directvnc'
		,'linuxvnc'
		,'xrdp'
		,'xserver-xephyr'
);
