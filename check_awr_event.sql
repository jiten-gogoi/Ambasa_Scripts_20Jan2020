set linesi 220;
 
alter session set nls_date_format='DD-MM-YYYY HH24:MI:SS';
 
col BEGIN_INTERVAL_TIME format a28
col event_name format a40
col WAIT_CLASS format a20
set pagesi 999
 
select distinct(WAIT_CLASS) from v$system_event;
 
select e.WAIT_CLASS,e.event_name,s.begin_interval_time,e.TOTAL_WAITS,e.TIME_WAITED_MS,e.TIME_WAITED_MS / TOTAL_WAITS "MS_PER_WAIT"
from
(
select instance_number,snap_id,WAIT_CLASS,event_name,
total_waits - first_value(total_waits) over (partition by event_name order by snap_id rows 1 preceding) "TOTAL_WAITS",
(time_waited_micro - first_value(time_waited_micro) over (partition by event_name order by snap_id rows 1 preceding))/1000 "TIME_WAITED_MS"
from
dba_hist_system_event
where
WAIT_CLASS like nvl('&WAIT_CLASS',WAIT_CLASS)
and event_name like nvl('&event_name',event_name)
and instance_number = (select instance_number from v$instance)
) e, dba_hist_snapshot s
where e.TIME_WAITED_MS > 0
and e.instance_number=s.instance_number
and e.snap_id=s.snap_id
and s.BEGIN_INTERVAL_TIME >= trunc(sysdate-&sysdate_nb_day_begin_interval+1)
and s.BEGIN_INTERVAL_TIME <= trunc(sysdate-&sysdate_nb_day_end_interval+1) order by 1,2,3;
