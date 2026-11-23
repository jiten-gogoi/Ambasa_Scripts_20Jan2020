select  username,
t.used_ublk ,t.used_urec
from    gv$transaction t,gv$session s
where   t.addr=s.taddr and
s.sid=&sid;
