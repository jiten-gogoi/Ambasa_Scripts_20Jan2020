select p.spid,s.sid,s.serial#,s.username from v$session s, v$process p where s.sid = (select sid from v$mystat where rownum=1)
and p.addr = s.paddr;
l
