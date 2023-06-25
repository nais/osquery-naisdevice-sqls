WITH
    ufw_installed
AS (
    SELECT
        COUNT(*) AS ufw_installed_counts
    FROM
        deb_packages
    WHERE
        name == 'ufw'
    AND
        status LIKE '%installed%'
)
SELECT
    *
FROM
    ufw_installed
WHERE
    ufw_installed_counts != 1;