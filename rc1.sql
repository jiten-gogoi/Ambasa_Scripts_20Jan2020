alter session set nls_date_format='DD-MON-YYYY HH24:MI:SS';
select fuzzy, status, error, recover, checkpoint_change#, checkpoint_time, count(*) from v$datafile_header group by fuzzy, status, error, recover, checkpoint_change#, checkpoint_time ;
select file#, substr(name, 1, 50), substr(tablespace_name, 1, 15), undo_opt_current_change# from v$datafile_header where fuzzy='YES' ;
