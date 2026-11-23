select o.OBJECT_TYPE, substr(o.OBJECT_NAME,1,10)
  objname , b.objd , b.status, count(b.objd) from v$bh b,
  dba_objects o where b.objd = o.data_object_id and
  o.owner = 'AMBASA' and o.object_name='AMBASA_BUFFER_TEST' group by o.object_type,
  o.object_name,b.objd, b.status ;

