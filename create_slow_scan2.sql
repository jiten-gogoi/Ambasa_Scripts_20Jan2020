drop table t2 purge;
CREATE TABLE t2 AS
SELECT *
FROM dba_objects
WHERE 1 = 2;
BEGIN
INSERT INTO t1
SELECT *
FROM dba_objects;
commit;
END;
/

CREATE UNIQUE INDEX i2
ON t2(object_id);

BEGIN
dbms_stats.gather_table_stats(
USER, 't2',
cascade => TRUE,
estimate_percent => 100,
method_opt => 'FOR ALL COLUMNS SIZE 1',
no_invalidate => FALSE);
END;
/
exit;

