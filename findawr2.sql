set lines 200
set long 50000
col sql_text format a41
select sql_id, sql_text
from dba_hist_sqltext
where upper(sql_text) like upper(nvl('&sql_text',sql_text))
and sql_text not like '%from v$sql where sql_text like nvl(%'
and sql_id like nvl('&sql_id',sql_id)
/

