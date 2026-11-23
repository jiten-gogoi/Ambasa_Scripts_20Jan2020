drop user ggadmin_ambasat1 cascade;

create user ggadmin_ambasat1 identified by ggadmin_ambasat1
default tablespace ggs_data
temporary tablespace temp;

--GRANT connect, resource, dba to ggadmin_ambasat1 ;
--EXEC DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE (grantee=>'ggadmin_ambasat1',privilege_type=>'capture',grant_select_privileges=>true, do_grants=>TRUE);

grant connect,resource,dba to ggadmin_ambasat1 ;
grant connect,resource to ggadmin_ambasat1 ;
grant select any dictionary, select any table to ggadmin_ambasat1 ;
grant insert any table to ggadmin_ambasat1 ;
grant update any table to ggadmin_ambasat1 ;
grant delete any table to ggadmin_ambasat1 ;
grant select any table to ggadmin_ambasat1 ;
grant create any table to ggadmin_ambasat1 ;
grant alter  any table to ggadmin_ambasat1 ;
grant drop   any table to ggadmin_ambasat1 ;
grant create any sequence to ggadmin_ambasat1 ;
grant flashback any table to ggadmin_ambasat1 ;
grant execute on dbms_flashback to ggadmin_ambasat1 ;
grant execute on utl_file to ggadmin_ambasat1 ;
grant select any transaction to ggadmin_ambasat1 ;
EXEC DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE (grantee=>'ggadmin_ambasat1',privilege_type=>'capture',grant_select_privileges=>true, do_grants=>TRUE);
