SET TERMOUT OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET ECHO OFF



column in_db_name new_value out_db_name noprint
column in_spid new_value out_spid noprint
column in_user new_value out_user noprint
column in_path new_value out_path noprint

SET TERMOUT ON
ACCEPT hit_any_key PROMPT 'SQL in file SQL_FILE.sql - hit return to continue '
SET TERMOUT OFF

select value in_db_name, '10053_' || user in_user
from v$parameter
where name = 'db_name';

select value in_path
from v$parameter
where name = 'user_dump_dest';

alter session set tracefile_identifier = &out_user;

select p.spid in_spid
from v$process p, v$session s
where p.addr = s.paddr
and s.username = USER
and s.sid = (select sid from v$mystat where rownum = 1);

SET TERMOUT ON

PROMPT
PROMPT Start SQL Trace in your session

SELECT '&out_path' "Trace File Path" from dual;

SELECT '&out_db_name' || '_ora_' || '&out_spid' || '_' || lower('&out_user') || '.trc' "Trace File Name"
from dual;
PROMPT

alter session set events '10053 trace name context forever, level 2';

start SQL_FILE.sql

alter session set events '10053 trace name context off';

SET TERMOUT ON
SET FEEDBACK ON
SET VERIFY ON
SET ECHO ON

