select s.sid,s.serial#,s.username,substr(w.event, 1, 28) event, s.sql_hash_value, count(*)
from v$session_wait w, v$session s, v$process p
where s.sid=w.sid
and p.addr = s.paddr
and s.username is not null
and w.event not like '%pipe%'
and w.event not like 'SQL*%'
group by s.sid,s.serial#,s.username,substr(w.event, 1, 28), sql_hash_value
order by 3
/
