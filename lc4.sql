select sid Holder ,KGLPNUSE Sesion , KGLPNMOD Held, KGLPNREQ Req
from x$kglpn , v$session
where KGLPNHDL in (select p1raw from v$session_wait
where wait_time=0 and event like '%library cache%')
and KGLPNMOD <> 0
and v$session.saddr=x$kglpn.kglpnuse ;

