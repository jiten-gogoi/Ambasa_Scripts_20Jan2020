select FILE#, ts.name, ts.ts#, ts.con_id 
  from v$datafile d, v$tablespace  ts
  where d.ts#=ts.ts#
  and   d.con_id=ts.con_id
  order by 4,3;
l
