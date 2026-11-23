set long 10000000
set longchunksize 10000000
set linesize 200

accept v_sid prompt "Enter Session ID : "

accept v_serial prompt "Enter Session Serial# : "


col key format 999999999999
set colsep '||'

select key, sql_id, sql_exec_id,
    to_char(max(sql_exec_start) ,'DD/MM/YYYY HH24:Mi:SS')
         sql_exec_start,
    sql_child_address child_address
  from v$sql_monitor
 where sid=&v_sid
   and session_serial#=&v_serial
group by key, sql_id, sql_exec_id, sql_child_address
order by sql_exec_start;

--Once you've found the query you want to monitor (SQL_ID, SQL_EXEC_ID and SQL_EXEC_START are a unique key to define the query execution), you can follow the query progress in "Real Time" :

accept v_sql_id prompt "Enter the SQL_ID to look at : "

accept v_sql_exec_id prompt "Enter the associated SQL_EXEC_ID to look at : "

accept v_sql_exec_start prompt "Enter the Execution Start Date (DD/MM/YYYY HH24:MI:SS) : "


col id format 999
col operation format a25
col object format a6
set colsep '||'
col cardinality format 999999999999
select p.id,
    rpad(' ',p.depth*2, ' ')||p.operation operation,
    p.object_name object,
    p.cardinality card,
    p.cost cost,
    substr(m.status,1,4) status,
    m.output_rows
 from v$sql_plan p, v$sql_plan_monitor m
where p.sql_id=m.sql_id
 and p.child_address=m.sql_child_address
 and p.plan_hash_value=m.sql_plan_hash_value
 and p.id=m.plan_line_id
 and m.sql_id='&&v_sql_id'
 and m.sql_exec_id=&&v_sql_exec_id
 and m.sql_exec_start=to_date('&&v_sql_exec_start',
                            'DD/MM/YYYY HH24:MI:SS')
order by p.id;

variable v_report CLOB;

set long 10000000
set longchunksize 10000000
set linesize 200

BEGIN
  :v_report :=DBMS_SQLTUNE.REPORT_SQL_MONITOR(
                sql_id=>'&&v_sql_id',
                sql_exec_id=>&&v_sql_exec_id,
                sql_exec_start=>to_date('&&v_sql_exec_start',
                        'DD/MM/YYYY HH24:Mi:SS'),
                report_level=>'ALL');
END;
/
print :v_report
