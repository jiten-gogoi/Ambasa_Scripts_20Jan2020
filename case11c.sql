set lines 200 pages 1000 sqlbl on
alter system flush shared_pool;
l
show user

variable b1 varchar2(10);
exec :b1:='KING';
select /*+ VIVEK */ * from emp where ename=:b1;
pause
select sql_id, sql_text, executions, child_latch, version_count from 
v$sqlarea where sql_text like 'select /*+ VIVEK%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch, 
translation_mismatch from v$sql_shared_cursor where sql_id='f2q4bgycc2b1y';

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
  S.SQL_ID='f2q4bgycc2b1y'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

variable b1 varchar2(30);
exec :b1:='KING';
select /*+ VIVEK */ * from emp where ename=:b1;
pause

select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ VIVEK%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch, 
translation_mismatch from v$sql_shared_cursor where sql_id='f2q4bgycc2b1y';

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
  S.SQL_ID='f2q4bgycc2b1y'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

pause

variable b1 varchar2(70);
exec :b1:='KING';
select /*+ VIVEK */ * from emp where ename=:b1;

pause

select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ VIVEK%';

pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch, 
translation_mismatch from v$sql_shared_cursor where sql_id='f2q4bgycc2b1y';

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
  S.SQL_ID='f2q4bgycc2b1y'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

pause

REM Same Query with Different Optimizer Settings

pause
show parameter optimizer_index_cost_adj
pause
alter session set optimizer_index_cost_adj=100;
pause
show parameter optimizer_index_cost_adj

variable b1 varchar2(70);
exec :b1:='KING';
select /*+ VIVEK */ * from emp where ename=:b1;


pause

select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ VIVEK%';


pause

select sql_id, address, child_address, optimizer_mismatch, bind_mismatch, 
translation_mismatch from v$sql_shared_cursor where sql_id='f2q4bgycc2b1y';

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
  S.SQL_ID='f2q4bgycc2b1y'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

pause
show parameter optimizer_index_cost_adj
pause
alter session set optimizer_index_cost_adj=10;
pause
show parameter optimizer_index_cost_adj
