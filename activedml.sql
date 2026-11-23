Select username, sid, s.sql_id,s.sql_child_number,s.event,decode(state, 'WAITING','Waiting','Working') state,
decode(state,'WAITING','So far '||seconds_in_wait,'Last waited '||wait_time/100)||' secs for '||event "Description",
substr(sql_text,1,40) sql
from gv$session s, gv$sqltext t,v$transaction tra
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
and s.saddr = tra.ses_addr;
