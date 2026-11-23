select name, owner, statement_count from dba_sqlset where name='&sqlset_name';

select sqlset_owner,sqlset_name, sql_id, plan_hash_value FROM dba_sqlset_statements where sqlset_name ='&sqlset_name';

DECLARE 
 l_cursor sys_refcursor;
BEGIN 
open l_cursor for 
select value(p) from table(dbms_sqltune.select_cursor_cache('sql_id = ''&sql_id''')) p; 
dbms_sqltune.load_sqlset('&sqlset_name', l_cursor); 
close l_cursor;
END;
/ 

select name, owner, statement_count from dba_sqlset where name='&sqlset_name';

select sqlset_owner,sqlset_name, sql_id, plan_hash_value FROM dba_sqlset_statements where sqlset_name ='&sqlset_name';
