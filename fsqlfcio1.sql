set lines 200
col sql_text for a2499 word_wrapped
select sql_id,child_number,executions,rows_processed,disk_reads,buffer_gets,
elapsed_time/1000000 etime,
sql_text
from v$sql s
where upper(sql_text) like '%'||upper(nvl('&sql_text',sql_text))||'%'
and sql_text not like '%from v$sql where sql_text like nvl(%'
and sql_id like nvl('&sql_id',sql_id)
order by sql_id, child_number
/

