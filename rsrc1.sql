set lines 200 pages 1000
--col mapped_consumer_group for a20
col ORIGINAL_CONSUMER_GROUP for a20
col consumer_group for a20
select r.sid,
r.mapped_consumer_group,
r.mapping_attribute,
c.consumer_group original_consumer_group
from v$rsrc_session_info r, dba_rsrc_consumer_groups c
where r.orig_consumer_group_id = c.consumer_group_id;
