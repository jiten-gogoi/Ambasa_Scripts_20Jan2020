select status, enabled, count(*) from v$datafile group by status, enabled ;
select file#, substr(name, 1, 50), status, error, recover from v$datafile_header ;
