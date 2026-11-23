select repeat_interval, next_run_date from dba_scheduler_jobs
where job_name ='&job_name';
