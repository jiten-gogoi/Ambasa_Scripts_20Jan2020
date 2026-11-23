col event for a20
select event, sql_id, sql_child_number, count(*) cnt from v$active_session_history where event like 'latch%' and sample_time > 
sysdate-(1/24)
group by event, sql_id, sql_child_number
order by 4 desc
/
