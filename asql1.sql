set lines 200 long 99999999 pages 1000
col module for a10
col event for a10
col state for a10
COL FORMAT for A12
COL sql FORMAT A50 wrap
col "Description" format a20 wrap
col username for a10
col sid for 999


Select username, sid, s.sql_id,s.event,decode(state, 'WAITING','Waiting','Working') state,
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
and sql_text not like '%TOTAL_WAITS%'
and event not like '%SQL*Net%'
and status = 'ACTIVE'
;

