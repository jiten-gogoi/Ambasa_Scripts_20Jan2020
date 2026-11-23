select
     *
  from (
     select
        current_obj#,
        count(*) as db_time,
        round(count(*)*100/sum(count(*)) over (), 2) as pct_activity
     from
        gv$active_session_history
     where
        sample_time >= sysdate - (1/24/60/60)*60
        and session_type <> 'BACKGROUND'
        and event in (select
                         name
                      from
                         v$event_name
                      where
                         wait_class='User I/O')
        and session_state='WAITING'
     group by
        current_obj#
     order by
        count(*) desc)
  where
     rownum <=5;


