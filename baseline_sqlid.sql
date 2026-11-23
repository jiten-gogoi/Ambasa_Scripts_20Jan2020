set sqlbl on
SET LONG 10000
col EXACT_MATCHING_SIGNATURE for 99999999999999999999999999999999
SELECT sql_handle, plan_name, enabled, accepted,FIXED FROM dba_sql_plan_baselines WHERE signature IN ( SELECT exact_matching_signature FROM v$sql WHERE sql_id='&SQL_ID');

