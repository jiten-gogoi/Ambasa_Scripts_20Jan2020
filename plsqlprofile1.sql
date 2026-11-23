set lines 10000
column run_owner format a10
column run_comment format a40
select runid, run_owner, run_date, run_comment from plsql_profiler_runs;

