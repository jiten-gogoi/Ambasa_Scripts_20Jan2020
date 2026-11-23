set lines 200
col object_name for a20
col object_type for a15
col owner for a15

set pages 100000;
select distinct(o.owner), o.object_name, o.object_id, o.object_type, o.subobject_name,
CASE
  WHEN o.object_type = 'INDEX PARTITION' THEN to_char(si.savtime)
  WHEN o.object_type = 'TABLE PARTITION' THEN to_char(st.savtime)
  WHEN o.object_type = 'INDEX' THEN to_char(si.savtime)
  WHEN o.object_type = 'TABLE' THEN to_char(st.savtime)
  ELSE 'NOTHING'
END AS "nsavtime"
from dba_objects o, sys.WRI$_OPTSTAT_IND_HISTORY si, sys.WRI$_OPTSTAT_TAB_HISTORY st
where (o.owner, o.object_name) in (
select owner, index_name as object_name from dba_indexes
    where table_owner=('&&OWNER')
    and table_name in ('&&TABLE_NAME')
   union
    select owner, table_name as object_name from dba_tables
    where owner=('&OWNER')
    and table_name in ('&TABLE_NAME'))
and (o.object_id=si.obj#
or o.object_id=st.obj#)
--and si.savtime between  to_date('06-JUN-2014:10:30:00','DD-MON-YYYY:HH24:MI:SS')  and to_date('06-JAN-2014:16:10:00','DD-MON-YYYY:HH24:MI:SS')
--and st.savtime between to_date('06-JUN-2014:10:30:00','DD-MON-YYYY:HH24:MI:SS')  and to_date('06-JAN-2014:16:10:00','DD-MON-YYYY:HH24:MI:SS')
order by 6,4,2
/ 
undefine OWNER
undefine TABLE_NAME
