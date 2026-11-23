set sqlbl on pages 100 lines 200
col name for a50
col value for a20
select name,value from v$parameter_valid_values
where upper(name) like '%'||upper(nvl('&name',name))||'%'
and name not like '%from v$parameter_valid_values';
l
