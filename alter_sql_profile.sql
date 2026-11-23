-- Purpose:     (dbms_sql_tune.alter_sql_profile) - (name, category, status, description, fixed)
/*
CATEGORY - DEFAULT, SAVED, OTHER, etc...
STATUS - ENABLED, DISABLED
NAME -
DESCRIPTION - 
note: you can not change force_matching 
*/
exec dbms_sqltune.alter_sql_profile('&profile_name', '&attribute', '&value');
