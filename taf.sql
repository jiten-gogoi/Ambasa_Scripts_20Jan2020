set lines 200
set sqlbl on
col username for a20

select inst_id,username,sid,serial#,failover_type,failover_method,failed_over,client_identifier
from gv$session where username='SYSTEM';
