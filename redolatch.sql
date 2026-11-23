COLUMN name FORMAT a15
COLUMN gets FORMAT 99999999
COLUMN misses FORMAT 999999
COLUMN immediate_gets FORMAT 99999999 HEADING 'IMM_GETS'
COLUMN immediate_misses FORMAT 99999999 HEADING 'IMM_MISSES'
PROMPT Examining Contention for Redo Log Buffer Latches...
PROMPT ----------------------------------------------------

SELECT name, gets, misses, immediate_gets, immediate_misses,
Decode(gets,0,0,misses/gets*100) ratio1,
Decode(immediate_gets+immediate_misses,0,0,
immediate_misses/(immediate_gets+immediate_misses)*100) ratio2
FROM v$latch WHERE name IN ('redo allocation', 'redo copy');

/
