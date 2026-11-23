select to_char(h.begin_time, 'HH:MI') time,
h.average_waiter_count, h.dbtime_in_wait, h.time_waited
from v$waitclassmetric_history h, v$system_wait_class c
where h.wait_class_id = c.wait_class_id and c.wait_class = ' SCHEDULER'
order by h.begin_time;
