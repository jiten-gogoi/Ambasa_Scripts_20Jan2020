SELECT 'EXECUTE SYS.dbms_system.set_ev (' || TO_CHAR (sid) ||', ' || TO_CHAR (serial#) || ', 10046, 0, '''')'  FROM   v$session  WHERE sid in (&SID);

