set lines 200
col member for a50
select * from v$Loghist order by sequence# ;
SELECT a.group#,b.sequence#,b.first_change#,b.next_change#, a.member, b.status, b.archived, SUM(b.bytes)/1024/1024 mbytes
FROM v$logfile a, v$log b
WHERE a.group# = b.group#
GROUP BY a.group#,b.sequence#,b.first_change#,b.next_change#, a.member, b.status, b.archived
ORDER BY 2,1;

