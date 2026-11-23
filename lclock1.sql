select sid Waiter,  p1raw,
substr(rawtohex(p1),1,30) Handle,
substr(rawtohex(p2),1,30) Pin_addr
from gv$session_wait where wait_time=0 and event like 'library cache%';

