#SET LINESIZE 999 PAGESIZE 5000 TRIMOUT ON TRIMSPOOL ON 
SET LINESIZE 999 PAGESIZE 5000 TRIMSPOOL ON 

COL asqlmon_operation  HEAD Plan_Operation FOR a100
COL asqlmon_predicates HEAD PREDICATES     FOR a100 word_wrap
COL options   FOR a30

COL asqlmon_plan_hash_value HEAD PLAN_HASH_VALUE
COL asqlmon_sql_id          HEAD SQL_ID  NOPRINT
COL asqlmon_sql_child       HEAD CHILD#  NOPRINT
COL asqlmon_sample_time     HEAD SAMPLE_HOUR
COL projection FOR A520

COL pct_child HEAD "Activity %" FOR A8
COL pct_child_vis HEAD "Visual" FOR A12

COL asqlmon_id        HEAD "ID" FOR 9999
COL asqlmon_parent_id HEAD "PID"  FOR 9999


BREAK ON asqlmon_plan_hash_value SKIP 1 ON asqlmon_sql_id SKIP 1 ON asqlmon_sql_child SKIP 1 ON asqlmon_sample_time SKIP 1 DUP ON asqlmon_operation

VAR dbid NUMBER
VAR inst_id NUMBER

COL bdate NEW_VALUE def_bdate
COL edate NEW_VALUE def_edate

SET TERMOUT OFF

SELECT
    TO_CHAR(SYSDATE-1/24, 'YYYY-MM-DD HH24:MI') bdate
  , TO_CHAR(SYSDATE     , 'YYYY-MM-DD HH24:MI') edate
FROM
    dual
/

SET TERMOUT ON

ACCEPT sql_id CHAR FORMAT A13 DEFAULT '%'   PROMPT "Enter     SQL ID [       %        ]: "
ACCEPT bdate DATE FORMAT 'YYYY-MM-DD HH24:MI' DEFAULT '&def_bdate' PROMPT "Enter begin time [&def_bdate]: "
ACCEPT edate DATE FORMAT 'YYYY-MM-DD HH24:MI' DEFAULT '&def_edate' PROMPT "Enter   end time [&def_edate]: "



WITH  sample_times AS (
    select * from dual
), 
sq AS (
SELECT
    count(*) samples
  , ash.sql_id
  , ash.sql_child_number
  , ash.sql_plan_hash_value
  , ash.sql_plan_line_id
  , ash.sql_plan_operation
  , ash.sql_plan_options
  , ash.session_state
  , ash.event
  , AVG(ash.p3) avg_p3
FROM
    v$active_session_history ash
WHERE
    1=1
--AND ash.session_id = 8 AND ash.session_serial# =     35019
AND ash.sql_id LIKE '&&sql_id'
AND ash.sql_child_number LIKE '%&sql_child_number%'
AND ash.sample_time BETWEEN TO_DATE('&bdate', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('&edate', 'YYYY-MM-DD HH24:MI:SS')
GROUP BY
    ash.sql_id
  , ash.sql_child_number
  , ash.sql_plan_hash_value
  , ash.sql_plan_line_id
  , ash.sql_plan_operation
  , ash.sql_plan_options
  , ash.session_state
  , ash.event
)
SELECT
    plan.sql_id            asqlmon_sql_id
  , plan.child_number      asqlmon_sql_child
--  , plan.plan_hash_value asqlmon_plan_hash_value
  , sq.samples seconds
  , LPAD(TO_CHAR(ROUND(RATIO_TO_REPORT(sq.samples) OVER (PARTITION BY sq.sql_id, sq.sql_plan_hash_value) * 100, 1), 999.9)||' %',8) pct_child
  , '|'||RPAD( NVL( LPAD('#', ROUND(RATIO_TO_REPORT(sq.samples) OVER (PARTITION BY sq.sql_id, sq.sql_plan_hash_value) * 10), '#'), ' '), 10,' ')||'|' pct_child_vis
--, LPAD(plan.id,4)||CASE WHEN parent_id IS NULL THEN '    ' ELSE ' <- ' END||LPAD(plan.parent_id,4) asqlmon_plan_id
  , plan.id asqlmon_id
  , plan.parent_id asqlmon_parent_id
  , LPAD(' ', depth) || plan.operation ||' '|| plan.options || NVL2(plan.object_name, ' ['||plan.object_name ||']', null) asqlmon_operation
  , sq.session_state
  , sq.event
  , sq.avg_p3 
  , plan.object_alias || CASE WHEN plan.qblock_name IS NOT NULL THEN ' ['|| plan.qblock_name || ']' END obj_alias_qbc_name
  , CASE WHEN plan.access_predicates IS NOT NULL THEN '[A:] '|| plan.access_predicates END || CASE WHEN plan.filter_predicates IS NOT NULL THEN ' [F:]' || plan.filter_predicates END asqlmon_predicates
--  , plan.projection
FROM
    v$sql_plan plan
  , sq
WHERE
    1=1
AND sq.sql_id(+) = plan.sql_id
AND sq.sql_child_number(+) = plan.child_number
AND sq.sql_plan_line_id(+) = plan.id
AND sq.sql_plan_hash_value(+) = plan.plan_hash_value
AND plan.sql_id LIKE '&&sql_id'
AND plan.child_number LIKE '%&child_number%'
ORDER BY
    plan.child_number
  , plan.plan_hash_value
  , plan.id
/

undefine sql_id
