col module for a10
col event for a30
col state for a10
COL FORMAT for A12
SET LINESIZE 200
COL INST FORMAT 99
COL SQL FORMAT A10 wrap
col "Description" format a20
col username for a10
Select s.username, sw.sid, s.sql_id,decode(sw.state, 'WAITING','Waiting','Working') state,
decode(sw.state,'WAITING','So far '||sw.seconds_in_wait,'Last waited '||sw.wait_time/100)||' secs for '||sw.event "Description",
substr(t.sql_text,1,40) sql
from gv$session s, gv$session_wait sw, gv$sqltext t
where s.sid = sw.sid
and s.inst_id = t.inst_id
and s.sql_id = t.sql_id
and s.module not like 'SQL D%'
and s.module not like 'TOAD%'
and t.sql_text not like '%collect_session%'
and sql_text not like '%TOTAL_WAITS%'
and sw.event not like '%SQL*Net%'
and s.status = 'ACTIVE';
