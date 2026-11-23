SELECT s.sid, q.users_executing, q.sql_text 
   FROM v$session s, v$sql q
  WHERE s.sid=&sid AND q.address = s.sql_address 
  ORDER BY s.sid;
