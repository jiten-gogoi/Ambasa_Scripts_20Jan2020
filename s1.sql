set lines 200
set sqlbl on


SELECT
EVENT,
TOTAL_WAITS,
TIME_WAITED,
AVG_MS,
ROUND(RATIO_TO_REPORT(TIME_WAITED) OVER () * 100) PERCENT
FROM
( SELECT
SUBSTR(EVENT, 1, 30) EVENT,
TOTAL_WAITS,
TIME_WAITED,
ROUND(TIME_WAITED_MICRO / TOTAL_WAITS / 1000, 2) AVG_MS
FROM V$SYSTEM_EVENT
WHERE
WAIT_CLASS != 'Idle' AND
EVENT NOT IN
('db file parallel write', 'log file parallel write',
'log file sequential read', 'control file parallel write',
'control file sequential read', 'Log archive I/O')
UNION
SELECT 'CPU' EVENT, NULL, VALUE, NULL
FROM V$SYSSTAT
WHERE STATISTIC# = 12
ORDER BY 3 DESC)
WHERE ROWNUM <= 10;

