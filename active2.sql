Select inst_id,sid, username,(sysdate-sql_exec_start)*24*60*60 SECS,
logon_time,sql_id
from gv$session
where type != 'BACKGROUND' and event not like 'SQL*Net%' and
 event not like 'Streams AQ: waiting%'
and status = 'ACTIVE'
order by username;

