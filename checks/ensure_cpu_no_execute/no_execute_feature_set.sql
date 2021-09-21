WITH
    cpu_nx_enabled
AS (
	SELECT
		count(*) as cpu_no_execute
	FROM cpuid
	WHERE
		feature == 'nx'
    AND
        value == 1
)
SELECT 
    * 
FROM cpu_nx_enabled
WHERE
    cpu_no_execute != 1;