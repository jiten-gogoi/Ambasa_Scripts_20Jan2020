select fuzzy, status, error, recover, checkpoint_change#, checkpoint_time, count(*) from v$datafile_header 
group by fuzzy, status, error, recover, checkpoint_change#, checkpoint_time ;
l
