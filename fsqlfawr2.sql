-- Purpose:     find sql in DBA_HIST_SQLSTAT
set long 32000
set verify off
set pagesize 999
set lines 132
col username format a13
col prog format a22
col sql_text format a90
col sid format 999
col child_number format 99999 heading CHILD
col ocategory format a10
col avg_etime format 9,999,999.99
col etime format 9,999,999.99

select sql_id, 
dbms_lob.substr(sql_text,3999,1) sql_text
from dba_hist_sqltext
where dbms_lob.substr(sql_text,3999,1) like nvl('&sql_text',dbms_lob.substr(sql_text,3999,1))
and sql_text not like '%from dba_hist_sqltext where sql_text like nvl(%'
and sql_id like nvl('&sql_id',sql_id)
/
