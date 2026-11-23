set pagesize 60 
set linesize 132 
select s.username username,  
       a.sid sid,  
       a.owner||'.'||a.object object,  
       s.lockwait,  
       t.sql_text SQL 
from   v$sqltext t,  
       v$session s,  
       v$access a 
where  t.address=s.sql_address  
and    t.hash_value=s.sql_hash_value  
and    s.sid = a.sid  
and    s.sid = &sid  
and    a.owner != 'SYS' 
and    upper(substr(a.object,1,2)) != 'V$' 
/ 
