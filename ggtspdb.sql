--alter session set container=CDB_ambasas_PDB1;
drop tablespace ggs_data including contents and datafiles;
create tablespace ggs_data datafile '/u02/app/oracle/oradata/ambasas/ambasas_pdb1/ggs_data01.dbf' size 200m;
