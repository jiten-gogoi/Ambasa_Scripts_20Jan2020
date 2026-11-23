select r.sid,
c1.consumer_group original_consumer_group,
c2.consumer_group current_consumer_group
from v$rsrc_session_info r, dba_rsrc_consumer_groups c1,
dba_rsrc_consumer_groups c2
where r.orig_consumer_group_id = c1.consumer_group_id
and r.current_consumer_group_id = c2.consumer_group_id
and r.orig_consumer_group_id != r.current_consumer_group_id;
