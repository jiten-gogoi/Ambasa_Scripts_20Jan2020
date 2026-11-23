set lines 200
col username for a10
select * from dba_stmt_audit_opts
union
select * from dba_priv_audit_opts
/
