SELECT a.name, b.value,b.sid
  FROM v$statname a, v$sesstat b
 WHERE a.statistic# = b.statistic#
   AND lower(a.name) = 'table fetch continued row';
