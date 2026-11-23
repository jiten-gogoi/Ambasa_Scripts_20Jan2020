alter database add logfile group 11 '/u02/app/oracle/oradata/ambasa11g/redo11.log' size 200m reuse;
alter database add logfile group 12 '/u02/app/oracle/oradata/ambasa11g/redo12.log' size 200m reuse;
alter database add logfile group 13 '/u02/app/oracle/oradata/ambasa11g/redo13.log' size 200m reuse;
alter system switch logfile;
alter system switch logfile;
alter system switch logfile;
