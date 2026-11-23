SELECT sql_id,child_number, bucket_id, count
FROM v$sql_cs_histogram
WHERE sql_id = '&sql_id'
ORDER BY child_number, bucket_id;
