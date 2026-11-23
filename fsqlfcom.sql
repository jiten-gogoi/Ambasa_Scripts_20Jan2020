set lines 200
col operation for a40
col options for a20
col optimizer for a20
select sql_id, OPERATION, options, optimizer from v$sql_plan
where sql_id in (select sql_id from v$sqlstats
where upper(sql_text) like '%'||upper(nvl('&sql_text',sql_text))||'%'
and sql_text not like '%from v$sql where sql_text like nvl(%'
and sql_id like nvl('&sql_id',sql_id));
