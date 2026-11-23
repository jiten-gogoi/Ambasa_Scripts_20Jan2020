COLUMN con_name FORMAT A20
COLUMN instance_name FORMAT A20

SELECT con_name, instance_name,con_id,state FROM cdb_pdb_saved_states;
l
