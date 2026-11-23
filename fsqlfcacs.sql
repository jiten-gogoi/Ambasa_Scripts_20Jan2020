set lines 200
col is_bind_sensitive for a20
col is_bind_aware for a15
col is_shareable for a15
SELECT sql_id,child_number, is_bind_sensitive, is_bind_aware, is_shareable, plan_hash_value
FROM v$sql WHERE sql_id = '&sql_id';
