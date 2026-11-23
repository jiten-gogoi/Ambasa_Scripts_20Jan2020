set lines 200
col name for a20
col value for a10
select name,value,issys_modifiable,isses_modifiable from v$parameter2 where name='&parameter_name';
