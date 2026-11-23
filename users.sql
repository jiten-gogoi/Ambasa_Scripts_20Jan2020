col username for a15
set lines 200
select username,account_status,default_tablespace,temporary_tablespace,profile from dba_users where username<>'BACKGROUND' and username not like '%SYS%';
