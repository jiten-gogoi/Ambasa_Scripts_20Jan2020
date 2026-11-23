select group#,status,bytes/1024/1024 from v$log;
select group#,member from v$logfile;

drop table ambasa_test1 purge;
CREATE TABLE ambasa_test1 AS SELECT * FROM dba_objects WHERE 1 = 2;
BEGIN
FOR i IN 1 .. 100 LOOP INSERT INTO ambasa_test1 SELECT * FROM dba_objects;
END LOOP;
UPDATE ambasa_test1 SET object_id = ROWNUM;
COMMIT;
END;
/

