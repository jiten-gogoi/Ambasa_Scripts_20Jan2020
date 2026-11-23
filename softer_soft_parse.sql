alter system flush shared_pool
connect ambasa/a

set echo on

drop table t purge;
CREATE TABLE t (
  id NUMBER,
  val NUMBER,
  pad VARCHAR2(4000),
  CONSTRAINT t_pk PRIMARY KEY (id)
);

execute dbms_random.seed(0)

INSERT INTO t
SELECT rownum, dbms_random.value, dbms_random.string('p',500)
FROM dual
CONNECT BY level <= 1000;

COMMIT;

CREATE INDEX t_val_i ON t (val);

BEGIN
  dbms_stats.gather_table_stats(
    ownname          => user,
    tabname          => 'T',
    estimate_percent => 100,
    method_opt       => 'for all columns size skewonly',
    cascade          => TRUE
  );
END;
/



Soft Parse :
------------
set serveroutput on

DECLARE
l_cursor INTEGER;
l_pad VARCHAR2(4000);
l_retval INTEGER;
BEGIN
l_cursor := dbms_sql.open_cursor;
dbms_sql.parse(l_cursor, 'SELECT pad FROM t WHERE val = :1', 1);
dbms_sql.define_column(l_cursor, 1, l_pad, 10);
FOR i IN 1..50
LOOP
dbms_sql.bind_variable(l_cursor, ':1', i);
l_retval := dbms_sql.execute(l_cursor);
IF dbms_sql.fetch_rows(l_cursor) > 0
THEN
NULL;
END IF;
END LOOP;
dbms_sql.close_cursor(l_cursor);
END;
/

--SELECT pad FROM t WHERE val =
@fsqlfc
