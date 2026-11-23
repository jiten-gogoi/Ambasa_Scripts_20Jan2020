col module for a10
col event for a30
col state for a10
COL FORMAT for A12
SET LINESIZE 200
COL INST FORMAT 99
COL SQL FORMAT A10 wrap
col "Description" format a20
col username for a10
Select username, s.inst_id INST,module, sid, s.sql_id, (sysdate - sql_exec_start)*24*60*60
SECS,decode(state, 'WAITING','Waiting','Working') state,
decode(state,'WAITING','So far '||seconds_in_wait,'Last waited '||wait_time/100)||' secs for '||event "Description",
substr(sql_text,1,40) sql
from gv$session s, gv$sqltext t
where s.sql_id = t.sql_id
and s.inst_id = t.inst_id
and piece = 0
and (sysdate-sql_exec_start)*24*60*60 > 0
and module not like 'SQL D%'
and module not like 'TOAD%'
and sql_text not like '%collect_session%'
and sql_text not like '%TOTAL_WAITS%';
and Description.event not like '%SQL*Net%;
--and s.event not like '%SQL*Net%;

