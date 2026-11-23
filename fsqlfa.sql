col BEGIN_INTERVAL_TIME for a25
set pages 3000
set lines 200
select s.snap_id,s.begin_interval_time,sql.sql_id as sql_id,sql.PLAN_HASH_VALUE, sql.executions_delta as exe_delta, 
sql.EXECUTIONS_TOTAL,
elapsed_time_delta/1000000 "elapsed_time_delta In Seconds" ,cpu_time_delta/1000000 "cpu_time_delta In Seconds" 
from dba_hist_sqlstat sql, dba_hist_snapshot s
where s.snap_id = SQL.snap_id
and sql.SQL_ID='&SQL_ID'
order by s.begin_interval_time; 

