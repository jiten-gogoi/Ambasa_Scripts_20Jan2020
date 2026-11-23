select sqlset_name,id,sqlset_owner, description from dba_sqlset_references;
exec dbms_sqltune.remove_sqlset_reference (sqlset_name => '&sqlset_name',reference_id => &id);
select name, owner, statement_count from dba_sqlset;
