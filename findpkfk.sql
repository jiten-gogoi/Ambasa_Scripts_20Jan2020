column owner_name format a10 
column table_name format a25 
column key_name format a15 
column referencing_table format a15 
column foreign_key_name format a15 

SELECT a.owner owner_name,
  a.table_name table_name,
  a.constraint_name key_name,
  b.table_name referencing_table,
  b.constraint_name foreign_key_name
FROM dba_constraints a,
  dba_constraints b
WHERE a.constraint_name = b.r_constraint_name
AND a.table_name='&PARENT_TABLE_NAME'
AND b.constraint_type   = 'R'
ORDER BY 1,  2,  3,  4;
