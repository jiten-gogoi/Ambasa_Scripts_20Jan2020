select unique THREAD# AS THREAD,MAX(SEQUENCE#) OVER (PARTITION BY thread#) AS LAST from gv$archived_log;
l
