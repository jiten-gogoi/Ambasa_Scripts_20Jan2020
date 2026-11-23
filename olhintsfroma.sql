SELECT other_xml FROM dba_hist_sql_plan WHERE sql_id = '&sql_id' AND plan_hash_value =&plan_hash_value
AND other_xml IS NOT NULL  ORDER BY id;
