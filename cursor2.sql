--Let's see if any session is getting close to the limit.
select b.sid, a.username, b.value open_cursors
from v$session a,
v$sesstat b,
v$statname c
where c.name in ('opened cursors current')
and b.statistic# = c.statistic#
and a.sid = b.sid
and a.username is not null
and b.value >0
order by 3;
