col host_name for a15
col instance_name for a15
set lines 200
select name,open_mode,log_mode from v$database;
select name, host_name from v$database, v$instance;

select instance_name,host_name,to_char(STARTUP_TIME,'dd/mm/yyyy hh24:mm') "STARTUP_TIME",status from v$instance;


