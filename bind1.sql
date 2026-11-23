SELECT sql_id,child_number, peeked, executions, rows_processed, buffer_gets
FROM v$sql_cs_statistics
WHERE sql_id = '&sql_id'
ORDER BY child_number;
l
