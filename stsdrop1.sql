select name, owner, statement_count from dba_sqlset;
EXEC DBMS_SQLTUNE.DROP_SQLSET(sqlset_name => '&sqlset_name');
select name, owner, statement_count from dba_sqlset;
