/*
     This file is part of demos for "Mutex Internals"  seminar v.04.04.2011
     Andrey S. Nikolaev (Andrey.Nikolaev@rdtex.ru) 
     https://andreynikolaev.wordpress.com 
 
     "Cursor: pin S" contention testcase.
 
     The script spawn several sessions to induce "Cursor: pin S", 
     creates AWR snapshots and generates AWR report
 
     Beware: The script will restart the test database.
 
     usage: sqlplus /nolog @cursor_pin_s_contention.sql <parallelism>
 
*/ 
connect / as sysdba
startup force
set echo off
set define %
set verify off
set head off
set linesize 300
 
/* spawn parallel processes to create load on mutex */
spool one_thread.tmp
select 'set verify off' from dual;
select 'alter session set session_cached_cursors = 50;' from dual; 
select 'begin for i in 1..1000000 loop' from dual;
select '      execute immediate ''select 1 from dual where 1=2'';' from dual;
select 'end loop; end;'||chr(10)||'/' from dual;
spool off
 
/* sleep while AWR initialized */
host sleep 5
 
exec dbms_workload_repository.create_snapshot();
 
spool many_threads.tmp
select 'host sqlplus "/ as sysdba" @one_thread.tmp &'
from dba_objects where rownum <= %1;
spool off
 
@many_threads.tmp
host sleep 50
set echo on
exec dbms_workload_repository.create_snapshot();
set markup html on
set head on
spool mutex_sleep_history.htm
select to_char(SLEEP_TIMESTAMP,'hh:mi:ss.ff') SLEEP_TIMESTAMP,MUTEX_ADDR,MUTEX_IDENTIFIER,MUTEX_TYPE,
       GETS,SLEEPS,REQUESTING_SESSION,BLOCKING_SESSION,
       LOCATION,MUTEX_VALUE from x$mutex_sleep_history order by sleep_timestamp;
spool off
 
set define &
set markup html off
set echo off heading on underline on;
column inst_num  heading "Inst Num"  new_value inst_num  format 99999;
column inst_name heading "Instance"  new_value inst_name format a12;
column db_name   heading "DB Name"   new_value db_name   format a12;
column dbid      heading "DB Id"     new_value dbid      format 9999999999 just c;
select d.dbid            dbid
     , d.name            db_name
     , i.instance_number inst_num
     , i.instance_name   inst_name
  from v$database d,
       v$instance i;
define num_days=1;
define report_type='html';
col end_snap new_value end_snap;
col begin_snap new_value begin_snap;
select max(snap_id) end_snap from dba_hist_snapshot where dbid=&dbid;
select max(snap_id) begin_snap from dba_hist_snapshot where dbid=&dbid and snap_id < &end_snap;
define report_name='awr_report.htm';
@?/rdbms/admin/awrrpti
exit
