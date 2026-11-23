col next_change# for 9999999999999999
col status for a10
select group#,sequence#,status,archived,first_change#,next_change# from v$log;
l
