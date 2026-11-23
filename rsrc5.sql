select to_char(begin_time, 'HH:MI') time,
60 * (select value from v$osstat where stat_name = 'NUM_CPUS') total,
60 * (select value from v$parameter where name = 'cpu_count') db_total,
sum(cpu_consumed_time) / 1000 consumed,
sum(cpu_wait_time) / 1000 throttled
from gv$rsrcmgrmetric_history
group by begin_time order by begin_time;
