select description, created, owner from DBA_SQLSET_REFERENCES where sqlset_name = 'STS1';

exec DBMS_SQLTUNE.DROP_TUNING_TASK('&saa_task_name');
