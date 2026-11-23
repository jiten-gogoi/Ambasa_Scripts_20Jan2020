select
     *
  from (
     select
        session_id||':'||session_serial# as "SID:SERIAL",
        count(*) as db_time,
        round(count(*)*100/sum(count(*)) over (), 2) as pct_activity
     from
        gv$active_session_history
     where
        sample_time >= sysdate - (1/24/60/60)*60
        and session_type <> 'BACKGROUND'
     group by
        session_id||':'||session_serial#
     order by
        count(*) desc)
  where
     rownum <=5;

