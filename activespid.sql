select SPID from v$process where addr  in (select paddr from v$session where sid in 
(SELECT a.sid   FROM v$session a, v$transaction b WHERE a.saddr = b.ses_addr and b.ses_addr in (select ses_addr from V$transaction where status='ACTIVE'))) ;
