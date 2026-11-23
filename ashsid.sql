col sid for 999
col sql_text for a45 wrap
col event for a20
set lines 200
select * 
from (
    select
        h.session_id as sid,
        to_char(h.sample_time,'mi:ss') as sample_time,
        h.blocking_session as blocker,h.event,
        h.sql_id,
        (select sql_text from v$sqlarea a where a.sql_id = h.sql_id) as sql_text
    from
        v$active_session_history h
    where
        h.session_id = &sid
    order by h.sample_time desc
) where rownum <= 20 
; 
l
