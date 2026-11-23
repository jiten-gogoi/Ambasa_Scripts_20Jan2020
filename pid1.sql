--select pid,spid from v$process where addr=(select paddr from v$session where sid=&sid);
select p.PID,p.SPID,s.SID,s.USERNAME from v$process p,v$session s
where s.paddr = p.addr and s.sid = &SESSION_ID;

