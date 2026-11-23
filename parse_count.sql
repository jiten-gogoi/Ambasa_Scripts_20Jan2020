select a.name, b.value 
   from v$statname a, v$mystat b 
  where a.statistic# =  b.statistic# 
    and ( a.name like '%parse count%' 
       or a.name like 'session cursor cache%') 
    and value>0;
