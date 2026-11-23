DECLARE
 l_sql_handle_dropped  PLS_INTEGER;
BEGIN
 l_sql_handle_dropped := DBMS_SPM.drop_sql_plan_baseline (sql_handle =>'&sql_handle');
 DBMS_OUTPUT.put_line(l_sql_handle_dropped);
end;
/
