select log_id, log_date from  DBA_SCHEDULER_JOB_LOG where
job_name = '&job_name' order by log_date desc ;
