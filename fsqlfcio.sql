select sql_id,child_number,parse_calls,loads,executions,rows_processed,disk_reads,buffer_gets,
executions/((sysdate-to_date(first_load_time,'YYYY-MM-DD/HH24:MI:SS'))*(24*60*60)) execs_per_sec,
elapsed_time/1000000 etime,(elapsed_time/1000000)/decode(nvl(executions,0),0,1,executions) avg_etime,
sql_text
from v$sql s
where upper(sql_text) like '%'||upper(nvl('&sql_text',sql_text))||'%'
and sql_text not like '%from v$sql where sql_text like nvl(%'
and sql_id like nvl('&sql_id',sql_id)
order by sql_id, child_number
/

