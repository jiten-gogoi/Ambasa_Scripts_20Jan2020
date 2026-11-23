select a.sid Holder ,a.SERIAL#,b.INST_ID,b.KGLPNUSE Sesion , b.KGLPNMOD Held, b.KGLPNREQ Req
from x$kglpn b , v$session a
where b.KGLPNHDL in (select p1raw from v$session_wait
where wait_time=0 and event like 'library cache%')
and b.KGLPNMOD <> 0
and a.saddr=b.kglpnuse ;

