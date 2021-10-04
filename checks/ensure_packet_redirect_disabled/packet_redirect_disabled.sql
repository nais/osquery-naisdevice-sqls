SELECT 
    REGEX_MATCH(name, 'net.ipv4.conf.(all|default).send_redirects', 0) AS parameter, current_value 
FROM 
    system_controls 
WHERE 
    parameter IS NOT NULL
AND 
    current_value != 0;