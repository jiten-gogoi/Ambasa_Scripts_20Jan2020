select to_char(begin_time, 'HH:MI') time,
consumer_group_name,
60 * (select value from v$osstat where stat_name = 'NUM_CPUS') total,
60 * (select value from v$parameter where name = 'cpu_count') db_total,
cpu_consumed_time / 1000 consumed,
cpu_consumed_time / (select value from v$parameter where name =
'cpu_count') / 600 cpu_utilization,
cpu_wait_time / 1000 throttled
from v$rsrcmgrmetric_history
order by begin_time;
