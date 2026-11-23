SELECT name, value/1024/1024, unit
FROM v$pgastat
WHERE name LIKE 'aggregate PGA %';
