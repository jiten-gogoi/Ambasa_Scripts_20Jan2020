SELECT 'EXECUTE SYS.dbms_system.set_ev (' || TO_CHAR (sid) ||', ' || TO_CHAR (serial#) || ', 10053, 1, '''')'  FROM   v$session  WHERE sid in (&SID);

