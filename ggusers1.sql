drop user ggadmin_ambasas1 cascade;

create user ggadmin_ambasas1 identified by ggadmin_ambasas1
default tablespace ggs_data
temporary tablespace temp;

--GRANT connect, resource, dba to ggadmin_ambasas1 ;
--EXEC DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE (grantee=>'ggadmin_ambasas1',privilege_type=>'capture',grant_select_privileges=>true, do_grants=>TRUE);

grant connect,resource to ggadmin_ambasas1 ;
grant select any dictionary, select any table to ggadmin_ambasas1 ;
grant insert any table to ggadmin_ambasas1 ;
grant update any table to ggadmin_ambasas1 ;
grant delete any table to ggadmin_ambasas1 ;
grant select any table to ggadmin_ambasas1 ;
grant create any table to ggadmin_ambasas1 ;
grant alter  any table to ggadmin_ambasas1 ;
grant drop   any table to ggadmin_ambasas1 ;
grant create any sequence to ggadmin_ambasas1 ;
grant flashback any table to ggadmin_ambasas1 ;
grant execute on dbms_flashback to ggadmin_ambasas1 ;
grant execute on utl_file to ggadmin_ambasas1 ;
grant select any transaction to ggadmin_ambasas1 ;
EXEC DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE (grantee=>'ggadmin_ambasas1',privilege_type=>'capture',grant_select_privileges=>true, do_grants=>TRUE);
