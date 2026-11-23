set long 10000000
set longchunksize 10000000
set linesize 200

select DBMS_SQLTUNE.REPORT_SQL_MONITOR(sql_id=>'&sql_id',report_level=>'TYPICAL',type=>'TEXT') 
from dual;
