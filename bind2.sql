set lines 200
SELECT sql_id,child_number, trim(predicate) AS predicate, low, high
FROM v$sql_cs_selectivity
WHERE sql_id = '&sql_id'
ORDER BY child_number;
l
