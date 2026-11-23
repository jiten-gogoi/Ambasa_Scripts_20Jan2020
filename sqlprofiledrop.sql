select * from dba_sql_profiles;

exec dbms_sqltune.drop_sql_profile('&SQL_PROFILE_NAME');

select * from dba_sql_profiles;
