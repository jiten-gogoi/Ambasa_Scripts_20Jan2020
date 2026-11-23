variable b1 varchar2(10);
exec :b1:='KING';
select /*+ VIVEK */ * from emp where ename=:b1;
pause
select sql_id, sql_text, executions, child_latch, version_count from 
v$sqlarea where sql_text like 'select /*+ VIVEK%';
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
  S.SQL_ID='&sql_id'
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
  S.SQL_ID='&sql_id'
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
  S.SQL_ID='&sql_id'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

pause

variable b1 varchar2(250);
exec :b1:='KING';
select /*+ VIVEK */ * from emp where ename=:b1;


pause

select sql_id, sql_text, executions, child_latch, version_count from
v$sqlarea where sql_text like 'select /*+ VIVEK%';

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
  S.SQL_ID='&sql_id'
  AND S.CHILD_ADDRESS=SBM.ADDRESS
ORDER BY
  S.CHILD_NUMBER,
  SBM.POSITION;

