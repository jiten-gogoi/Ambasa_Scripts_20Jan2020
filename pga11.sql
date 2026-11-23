SELECT name, value/1024/1024, unit
FROM v$pgastat
WHERE name IN ('aggregate PGA target parameter',
'maximum PGA allocated',
'over allocation count');
