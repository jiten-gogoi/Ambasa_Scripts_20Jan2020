drop table emp purge;
create table emp as select * from scott.emp;
DECLARE
l_ename emp.ename%TYPE := 'SCOTT';
l_empno emp.empno%TYPE;
l_cursor INTEGER;
l_retval INTEGER;
BEGIN
l_cursor := dbms_sql.open_cursor;
dbms_sql. parse(l_cursor, 'SELECT empno FROM emp WHERE ename = :ename', 1);
dbms_sql. define_column(l_cursor, 1, l_empno);
dbms_sql. bind_variable(l_cursor, ':ename', l_ename);
l_retval := dbms_sql. execute(l_cursor);
IF dbms_sql. fetch_rows(l_cursor) > 0
THEN
dbms_sql. column_value(l_cursor, 1, l_empno);
dbms_output.put_line(l_empno);
END IF;
dbms_sql. close_cursor(l_cursor);
END;
/

DECLARE
l_ename emp.ename%TYPE := 'SCOTT';
l_empno emp.empno%TYPE;
BEGIN
SELECT empno INTO l_empno FROM emp WHERE ename = l_ename;
dbms_output.put_line(l_empno);
END;
/
