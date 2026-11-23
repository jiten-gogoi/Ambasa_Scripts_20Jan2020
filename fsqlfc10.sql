set lines 200 pages 1000

select sql_id,sql_text
from v$sql s, dba_users u
where upper(sql_text) like '%'||upper(nvl('&sql_text',sql_text))||'%'
and sql_text not like '%from v$sql where sql_text like nvl(%'
and sql_id like nvl('&sql_id',sql_id)
and u.user_id = s.parsing_user_id;
