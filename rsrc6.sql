select to_char(begin_time, 'HH:MI') time,
(select value from v$osstat where stat_name = 'NUM_CPUS') num_cpus,
(select value from v$parameter where name = 'cpu_count') num_db_cpus,
sum(cpu_consumed_time) / 60000 avg_running,
sum(cpu_wait_time) / 60000 avg_throttled
from v$rsrcmgrmetric_history
group by begin_time order by begin_time;
