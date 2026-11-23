set long 20000
set lines 200
select dbms_metadata.get_ddl('PROFILE','DEFAULT') from dual;
l
