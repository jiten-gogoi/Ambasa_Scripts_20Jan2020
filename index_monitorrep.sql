SET TERMOUT OFF
rem CLEAR SCREEN 
SET LINESIZE 100
SET FEEDBACK OFF
SET VERIFY OFF
SET ECHO OFF
SET PAGESIZE 20
SET HEADING OFF
REM
REM
SET TERMOUT ON
REM
PROMPT
PROMPT Index Monitoring Report
PROMPT =========================================================================
PROMPT


select to_char(sysdate,'mm/dd/yy hh:mi:ss') Date_Time from dual;
select 'Table Count = ' || count(*) from user_tables;
select 'Index Count = ' || count(*) from v$object_usage;
Select 'Indexes Used = ' || count(*) from v$object_usage where USED = 'YES';
select 'Indexes NOT Used = ' || count(*) from v$object_usage where USED = 'NO';



SET TERMOUT OFF
select '                          Index Monitoring Report    Date: ' || 
to_char(sysdate,'mm/dd/yy hh:mi:ss') from dual;

select 'Table Count = ' || count(*) from user_tables;
select 'Index Count = ' || count(*) from v$object_usage;
Select 'Indexes Used = ' || count(*) from v$object_usage where USED = 'YES';
select 'Indexes NOT Used = ' || count(*) from v$object_usage where USED = 'NO';

SET HEADING ON FEEDBACK ON ECHO ON VERIFY ON  PAGESIZE 20 TERMOUT On



