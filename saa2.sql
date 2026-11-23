SET LONG 100000
SET PAGESIZE 50000

SELECT DBMS_ADVISOR.get_task_script('&sql_Access_Task_name') AS script FROM   dual;
