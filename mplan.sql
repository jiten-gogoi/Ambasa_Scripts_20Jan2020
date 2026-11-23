select distinct SQL_ID, PLAN_HASH_VALUE,  To_char(TIMESTAMP,'dd:mm:yyyy hh24:mi:ss') from dba_hist_sql_plan where sql_id ='&sql_id' order by 3;
