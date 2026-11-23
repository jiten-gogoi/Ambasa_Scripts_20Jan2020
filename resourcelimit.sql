col RESOURCE_NAME for a25
col INITIAL_ALLOCATION for a15
col LIMIT_VALUE  for a15
set lines 200 pages 1000

select * from v$resource_limit order by 1;
