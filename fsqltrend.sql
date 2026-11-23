select
 s.snap_id,
 to_char(s.begin_interval_time,'HH24:MI') c1,
 sql.executions_delta c2,
 sql.buffer_gets_delta c3,
 sql.disk_reads_delta c4,
 sql.iowait_delta c5,
sql.cpu_time_delta c6,
 sql.elapsed_time_delta c7
 from
 dba_hist_sqlstat sql,
 dba_hist_snapshot s
 where
 s.snap_id = sql.snap_id
 and s.begin_interval_time > sysdate -1
 and
sql.sql_id='&sqlid'
 order by c7
 /Do we have multiple plan hash values for the same SQL ID – in that case may be changed plan is causing bad performance
select 
  SQL_ID 
, PLAN_HASH_VALUE 
, sum(EXECUTIONS_DELTA) EXECUTIONS
, sum(ROWS_PROCESSED_DELTA) CROWS
, trunc(sum(CPU_TIME_DELTA)/1000000/60) CPU_MINS
, trunc(sum(ELAPSED_TIME_DELTA)/1000000/60)  ELA_MINS
from DBA_HIST_SQLSTAT 
where SQL_ID in (
'&sqlid') 
group by SQL_ID , PLAN_HASH_VALUE
order by SQL_ID, CPU_MINS;
