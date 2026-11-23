col comp_name for a50
set lines 200 pages 1000
col status for a10
col version for a15
select comp_name,version,status from dba_registry;
l
