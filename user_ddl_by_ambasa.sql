define username=&username

begin
DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true);
end;
/
set long 200000 pages 	1000 lines 200 trimspool on echo off
col txt for a200 word_wrapped
set verify off
set feedback off


select dbms_metadata.get_ddl('TABLESPACE',NAME) txt
from v$tablespace
where NAME in
(select  distinct TABLESPACE_NAME
from     dba_segments
where    OWNER in ('&&username'));

select dbms_metadata.get_ddl('PROFILE',PROFILE) txt from DBA_USERS where username in ('&&username');
select 'create role ' ||GRANTED_ROLE|| ';'  from dba_role_privs where grantee in (select username from dba_users where 
username='&&username');
select 'create role ' ||ROLE|| ';' FROM DBA_ROLES where role IN ( select grantee from dba_tab_privs where 
grantor='&&username');

SELECT DBMS_METADATA.GET_DDL('USER', USERNAME) ||';' FROM DBA_USERS where username='&&username';

col quota format a10
select username
,      tablespace_name
,      decode(max_bytes, -1, 'unlimited'
       , ceil(max_bytes / 1024 / 1024) || 'M' ) "QUOTA"
from   dba_ts_quotas where username='&&username';
REM role_sys_and_tab_privs
select 'grant '||granted_role||' to ' ||grantee||';' from dba_role_privs where grantee in (select username from dba_users 
where username='&&username')
UNION ALL
select 'grant '||PRIVILEGE||' to '||grantee||';' from dba_sys_privs where grantee in (select username from dba_users where 
username='&&username') 
UNION ALL
select 'grant '||privilege||' on '||owner||'.'||table_name||' to ' ||grantee||';' from dba_tab_privs where grantee in 
(select username from dba_users where username='&&username');
select 'create role ' ||ROLE|| ';' FROM DBA_ROLES where role IN ( select grantee from dba_tab_privs where 
grantor='&&username') ;

SELECT OBJECT_TYPE,STATUS,COUNT(1) FROM DBA_OBJECTS WHERE OWNER='&&username' GROUP BY OBJECT_TYPE,STATUS;
select sum(bytes/(1024*1024*1024)) from dba_segments where owner='&&username';
select tablespace_name,sum(bytes/(1024*1024*1024)) from dba_segments where owner='&&username' group by tablespace_name;


undefine username
set term on
set lines 200
set verify on echo on feedback on

