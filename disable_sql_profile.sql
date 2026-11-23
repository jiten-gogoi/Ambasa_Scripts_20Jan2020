-- Purpose:     (dbms_sql_tune.alter_sql_profile) - disable
set verify off
EXEC DBMS_SQLTUNE.ALTER_SQL_PROFILE (name =>  '&profile_name',   attribute_name => 'STATUS', value =>  'DISABLED');

