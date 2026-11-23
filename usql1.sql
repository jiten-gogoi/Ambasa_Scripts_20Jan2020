SET VERIFY OFF
SET LINESIZE 255 pages 1000
COL SID FORMAT 9999999999
COL STATUS FORMAT A8
COL PROCESS FORMAT A10
COL SCHEMANAME FORMAT A16
COL OSUSER  FORMAT A16
COL SQL_TEXT FORMAT A50 HEADING 'SQL QUERY' wrap
COL MODULE	FORMAT A30
COL PROGRAM	FORMAT A30

SELECT s.sid,
       s.status,
       s.process,
       s.schemaname,
       s.module,
       s.osuser,
       sql.sql_id,
       sql.sql_text
       --p.program
FROM   v$session s,
       v$sql sql
WHERE  s.SQL_HASH_VALUE = sql.HASH_VALUE
AND    s.SQL_ADDRESS = sql.ADDRESS
AND    sql.parsing_user_id >ANY (select user_id from dba_users
where upper(username) like '%'||upper(nvl('&USERNAME',USERNAME))||'%') 
/

