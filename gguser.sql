drop user c##ggadmin_ambasas cascade;

create user c##ggadmin_ambasas identified by c##ggadmin_ambasas
default tablespace ggs_data
temporary tablespace temp;

grant connect,resource to c##ggadmin_ambasas;
grant select any dictionary, select any table to c##ggadmin_ambasas;
grant insert any table to c##ggadmin_ambasas;
grant update any table to c##ggadmin_ambasas;
grant delete any table to c##ggadmin_ambasas;
grant select any table to c##ggadmin_ambasas;
grant create any table to c##ggadmin_ambasas;
grant alter  any table to c##ggadmin_ambasas;
grant drop   any table to c##ggadmin_ambasas;
grant create any sequence to c##ggadmin_ambasas;
grant flashback any table to c##ggadmin_ambasas;
grant execute on dbms_flashback to c##ggadmin_ambasas;
grant execute on utl_file to c##ggadmin_ambasas;
grant select any transaction to c##ggadmin_ambasas;
