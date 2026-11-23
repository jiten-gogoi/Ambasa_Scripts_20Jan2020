SET PAGESIZE 5000 LINESIZE 1000 TRIMSPOOL ON TRIMOUT ON TAB OFF HEAD ON


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

ACCEPT sqlid CHAR FORMAT A13 DEFAULT '%'                           PROMPT "Enter     SQL ID [       %        ]: "

ACCEPT bdate DATE FORMAT 'YYYY-MM-DD HH24:MI' DEFAULT '&def_bdate' PROMPT "Enter begin time [&def_bdate]: "
ACCEPT edate DATE FORMAT 'YYYY-MM-DD HH24:MI' DEFAULT '&def_edate' PROMPT "Enter   end time [&def_edate]: "

BEGIN
SELECT inst_id, dbid INTO :inst_id, :dbid FROM gv$database;
END;
/


SELECT
    TO_CHAR(sample_time, 'YYYY-MM-DD HH24')||':00' sample_hour
  , sql_id
  , sql_plan_hash_value
  , COUNT(*) * 10 seconds
  , ROUND(COUNT(*) * 10 / 3600, 2) AAS
  , COUNT(DISTINCT sql_exec_start||sql_exec_id) sampled_execs
FROM 
    dba_hist_active_sess_history
WHERE
    dbid = :dbid
-- AND instance_number = :inst_id
AND sample_time BETWEEN TO_DATE('&bdate', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('&edate', 'YYYY-MM-DD HH24:MI:SS')
AND sql_id LIKE '&sqlid'
GROUP BY
    TO_CHAR(sample_time, 'YYYY-MM-DD HH24')||':00'
  , sql_id
  , sql_plan_hash_value
ORDER BY
    sample_hour
  , sql_id
/

set TRIMSPOOL OFF TRIMOUT OFF TAB ON HEAD ON
