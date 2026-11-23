col host_name for a20
col instance_name for a20
select inst_id,instance_name,host_name,status from gv$instance;
l

pause

select inst_id,con_id,name,open_mode from gv$pdbs;
l
