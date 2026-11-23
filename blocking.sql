select
    blocking_session,
    sid "Waiting_Session",    serial#,
    wait_class,
    seconds_in_wait 
from
    v$session 
where
    blocking_session is not NULL
order by
    blocking_session;
