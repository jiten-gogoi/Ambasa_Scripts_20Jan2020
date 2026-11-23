select to_char(begin_time,'dd.mm.yyyy:hh24:mi:ss') start_time,
to_char(end_time,'dd.mm.yyyy:hh24:mi:ss') end_time,
maxquerylen, maxqueryid, tuned_undoretention from v$undostat;
l
