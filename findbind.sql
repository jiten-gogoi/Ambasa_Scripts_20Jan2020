col sql_text for a30
col name for a10
col VALUE_STRING for a10
SELECT a.sql_text,b.name, b.position, b.datatype_string, b.value_string FROM v$sql_bind_capture b, v$sqlarea a WHERE b.sql_id = '&SQL_ID' AND b.sql_id = a.sql_id;
