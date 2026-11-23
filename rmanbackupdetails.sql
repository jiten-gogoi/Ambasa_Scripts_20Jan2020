select RECID, STAMP, COMPLETION_TIME, INCREMENTAL_LEVEL from v$backup_set where INCREMENTAL_LEVEL=&DBACKUP_LEVEL;
select start_time, END_Time, input_bytes/(1024*1024), output_bytes/(1024*1024), status from v$rman_backup_job_details order by 1
