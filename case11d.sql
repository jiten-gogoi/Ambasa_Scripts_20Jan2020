column sql_text for a30 wrap
set sqlbl on pages 100 lines 200

alter system flush shared_pool;
l
show user

variable b1 varchar2(10);
exec :b1:='KING';
select /*+ AMBASA */ * from emp where ename=:b1;
pause
select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ AMBASA%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch,
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

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch, 
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

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch, 
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

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch, 
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

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch, 
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

