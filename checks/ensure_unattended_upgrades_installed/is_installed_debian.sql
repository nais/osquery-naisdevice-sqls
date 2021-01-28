SELECT
	name
FROM
	deb_packages
WHERE
	name = 'unattended-upgrades'
AND
	status != 'install ok installed';
