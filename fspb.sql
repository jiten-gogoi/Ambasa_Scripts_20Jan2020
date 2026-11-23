col sql_handle for a30
col PLAN_NAME for a40
col SQL_TEXT for a70
select sql_handle, plan_name, enabled, accepted,origin, sql_text from dba_sql_plan_baselines;
l
