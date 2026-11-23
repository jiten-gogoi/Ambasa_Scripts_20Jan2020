select sql_id, plan_hash_value, CHILD_ADDRESS, CHILD_NUMBER, IS_OBSOLETE is_ob,
 is_bind_sensitive is_bi_se, is_bind_aware is_bi_aw, is_shareable is_sha from v$sql
 where sql_text like 'select * from acs_like%';


select sql_id, child_number, BIND_EQUIV_FAILURE from V$sql_shared_cursor
 where sql_id = '&sql_id';


select sql_id, child_number, bind_set_hash_value , peeked, executions, rows_processed,
 buffer_gets from V$SQL_CS_STATISTICS where sql_id = '&sql_id';


select * from V$SQL_CS_SELECTIVITY where sql_id = '&sql_id';

select * from V$SQL_CS_HISTOGRAM where sql_id = '&sql_id';
