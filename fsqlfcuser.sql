
select /* ambasarecentsql */ sql_id, child_number, hash_value, address, executions, sql_text
from v$sql
where parsing_user_id in (select user_id
from dba_users
where upper(username) like '%'||upper(nvl('&USERNAME',USERNAME))||'%')
and command_type in (2,3,6,7,189)
and upper(sql_text) not like upper('%ambasarecentsql%')
/
