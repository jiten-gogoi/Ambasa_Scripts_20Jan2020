set lines 200
set owner for a10
set sqlbl on
select   t.OWNER,
             t.job_name,t.STATUS,
             t.ACTUAL_START_DATE,
             t.ADDITIONAL_INFO
      from dba_scheduler_job_run_details t
     where  t.job_name like 'SCOTT_EMP11%' order by  t.ACTUAL_START_DATE;

