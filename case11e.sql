column sql_text for a30 wrap
set sqlbl on pages 100 lines 200

alter system flush shared_pool;
l
conn ambasa/a
show user

variable b1 varchar2(10);
exec :b1:='ADAMS';
select /*+ AMBASA */ * from emp where ename=:b1;
pause
select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ AMBASA%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch,language_mismatch,
translation_mismatch from v$sql_shared_cursor where sql_id='6v71fsrpvcjww';

pause

SELECT
  S.CHILD_NUMBER,
  SBM.POSITION,
  SBM.DATATYPE,
  SBM.MAX_LENGTH,
  SBM.BIND_NAME
FROM
  V$SQL S,
  V$SQL_BIND_METADATA SBM
WHERE
  S.SQL_ID='6v71fsrpvcjww'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;
variable b1 varchar2(10);
exec :b1:='KING';
select /*+ AMBASA */ * from emp where ename=:b1;
pause
select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ AMBASA%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch,language_mismatch,
translation_mismatch from v$sql_shared_cursor where sql_id='6v71fsrpvcjww';

pause

SELECT
  S.CHILD_NUMBER,
  SBM.POSITION,
  SBM.DATATYPE,
  SBM.MAX_LENGTH,
  SBM.BIND_NAME
FROM
  V$SQL S,
  V$SQL_BIND_METADATA SBM
WHERE
  S.SQL_ID='6v71fsrpvcjww'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

conn scott/tiger
show user

variable b1 varchar2(10);
exec :b1:='KING';
select /*+ AMBASA */ * from emp where ename=:b1;
pause
select sql_id, sql_text, executions, child_latch, version_count from 
v$sqlarea where sql_text like 'select /*+ AMBASA%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch,language_mismatch,
translation_mismatch from v$sql_shared_cursor where sql_id='6v71fsrpvcjww';

pause

SELECT
  S.CHILD_NUMBER,
  SBM.POSITION,
  SBM.DATATYPE,
  SBM.MAX_LENGTH,
  SBM.BIND_NAME
FROM
  V$SQL S,
  V$SQL_BIND_METADATA SBM
WHERE
  S.SQL_ID='6v71fsrpvcjww'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

variable b1 varchar2(30);
exec :b1:='KING';
select /*+ AMBASA */ * from emp where ename=:b1;
pause

select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ AMBASA%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch,language_mismatch,
translation_mismatch from v$sql_shared_cursor where sql_id='6v71fsrpvcjww';

pause

SELECT
  S.CHILD_NUMBER,
  SBM.POSITION,
  SBM.DATATYPE,
  SBM.MAX_LENGTH,
  SBM.BIND_NAME
FROM
  V$SQL S,
  V$SQL_BIND_METADATA SBM
WHERE
  S.SQL_ID='6v71fsrpvcjww'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

pause

variable b1 varchar2(70);
exec :b1:='KING';
select /*+ AMBASA */ * from emp where ename=:b1;

pause

select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ AMBASA%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch,language_mismatch,
translation_mismatch from v$sql_shared_cursor where sql_id='6v71fsrpvcjww';

pause

SELECT
  S.CHILD_NUMBER,
  SBM.POSITION,
  SBM.DATATYPE,
  SBM.MAX_LENGTH,
  SBM.BIND_NAME
FROM
  V$SQL S,
  V$SQL_BIND_METADATA SBM
WHERE
  S.SQL_ID='6v71fsrpvcjww'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

pause

show parameter optimizer_index_cost_adj

pause

REM Same Query with Different Optimizer Settings

alter session set optimizer_index_cost_adj=10;

pause

show parameter optimizer_index_cost_adj

pause
variable b1 varchar2(70);
exec :b1:='KING';
select /*+ AMBASA */ * from emp where ename=:b1;


pause

select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ AMBASA%';


pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch,language_mismatch,
translation_mismatch from v$sql_shared_cursor where sql_id='6v71fsrpvcjww';

pause

SELECT
  S.CHILD_NUMBER,
  SBM.POSITION,
  SBM.DATATYPE,
  SBM.MAX_LENGTH,
  SBM.BIND_NAME
FROM
  V$SQL S,
  V$SQL_BIND_METADATA SBM
WHERE
  S.SQL_ID='6v71fsrpvcjww'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;



pause

show parameter optimizer_index_cost_adj

pause

REM Default Optimizer Settings

alter session set optimizer_index_cost_adj=100;

pause

show parameter optimizer_index_cost_adj

pause

show parameter nls_language

alter session set nls_language='HINDI';

pause

show parameter nls_language


variable b1 varchar2(70);
exec :b1:='KING';
select /*+ AMBASA */ * from emp where ename=:b1;


pause

select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ AMBASA%';


pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch,language_mismatch,
translation_mismatch from v$sql_shared_cursor where sql_id='6v71fsrpvcjww';

pause

SELECT
  S.CHILD_NUMBER,
  SBM.POSITION,
  SBM.DATATYPE,
  SBM.MAX_LENGTH,
  SBM.BIND_NAME
FROM
  V$SQL S,
  V$SQL_BIND_METADATA SBM
WHERE
  S.SQL_ID='6v71fsrpvcjww'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;



pause

show parameter nls_language

alter session set nls_language='AMERICAN';

pause

show parameter nls_language

select * from v$sql_shared_cursor where sql_id='6v71fsrpvcjww';

set lines 200
col username format a13
col prog format a22
col sql_text format a41
col sid format 999
col child_number format 99999 heading CHILD
col ocategory format a10
col avg_etime format 9,999,999.99
col parse_calls format 9999999
col etime format 9,999,999.99
select sql_id, child_number, plan_hash_value plan_hash, parse_calls,executions execs, elapsed_time/1000000 etime,
(elapsed_time/1000000)/decode(nvl(executions,0),0,1,executions) avg_etime, u.username,
sql_text
from v$sql s, dba_users u
where sql_id='6v71fsrpvcjww'
and u.user_id = s.parsing_user_id
/


conn / as sysdba



