SELECT OSUSER, SERIAL#, SID, executions, sql.SQL_ID ,sql.child_number, SQL_TEXT  FROM V$SESSION sess JOIN V$SQL sql  
on  (sess.SQL_ID = sql.SQL_ID)  where sql.sQL_ID = '&sQL_ID';
