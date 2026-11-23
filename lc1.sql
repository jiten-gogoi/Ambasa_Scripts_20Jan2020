SELECT s.sid,
waiter.p1raw w_p1r,
holder.event h_wait,
holder.p1raw h_p1r,
holder.p2raw h_p2r,
holder.p3raw h_p2r,
count(s.sid) users_blocked,
sql.hash_value
FROM
v$sql sql,
v$session s,
x$kglpn p,
v$session_wait waiter,
v$session_wait holder
WHERE
s.sql_hash_value = sql.hash_value and
p.kglpnhdl=waiter.p1raw and
s.saddr=p.kglpnuse and
waiter.event like 'library cache pin' and
holder.sid=s.sid
GROUP BY
s.sid,
waiter.p1raw ,
holder.event ,
holder.p1raw ,
holder.p2raw ,
holder.p3raw ,
sql.hash_value
;
