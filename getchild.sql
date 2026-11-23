select sql_id, child_number, plan_hash_value from v$sql where sql_id='&sql_id';
