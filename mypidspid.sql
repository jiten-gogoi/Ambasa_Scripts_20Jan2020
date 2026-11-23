select pid,spid from v$process where addr=(select paddr from v$session where sid=(select sid from 
v$mystat where rownum=1));
l
