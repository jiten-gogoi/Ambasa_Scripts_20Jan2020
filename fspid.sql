select SPID from v$process where addr  in (select paddr from v$session where sid='&sid');
