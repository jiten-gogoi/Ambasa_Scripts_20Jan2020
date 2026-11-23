select session_id,count(*) from v$active_session_history
where session_state='WAITING' and SAMPLE_TIME > SYSDATE - (5/(24*60)) group by session_id order by count(*);


