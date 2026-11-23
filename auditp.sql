set lines 200
col name for a25
col value for a40
select name,value from v$parameter
where name like 'audit%'
/
