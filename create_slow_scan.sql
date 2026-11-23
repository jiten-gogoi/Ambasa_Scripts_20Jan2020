drop table t1 purge;
CREATE TABLE t1 AS
SELECT *
FROM dba_objects
WHERE 1 = 2;

BEGIN
FOR i IN 1 .. 100 LOOP
INSERT INTO t1
SELECT *
FROM dba_objects;
END LOOP;
UPDATE t1
SET object_id = ROWNUM;
COMMIT;
END;
/
CREATE UNIQUE INDEX i1
ON t1(object_id);
BEGIN
dbms_stats.gather_table_stats(
USER, 't1',
cascade => TRUE,
estimate_percent => 100,
method_opt => 'FOR ALL COLUMNS SIZE 1',
no_invalidate => FALSE);
END;
/

