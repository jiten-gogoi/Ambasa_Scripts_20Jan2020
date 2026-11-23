-- Purpose:     (dbms_sql_tune.alter_sql_profile) - enable
EXEC DBMS_SQLTUNE.ALTER_SQL_PROFILE (name =>  '&profile_name',   attribute_name => 'STATUS', value =>  'ENABLED');

