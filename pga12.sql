SELECT name, value/1024/1024, unit
FROM v$pgastat
WHERE name LIKE '% PGA allocated' OR name LIKE '% workareas';
