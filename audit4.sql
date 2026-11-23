set lines 200
set trimspool on
set pages 9999
col username for a6 trunc
col owner for a6 trunc
col obj_name for a20
col action_name for a20 trunc
col priv_used for a20 trunc
col audit_option for a20 trunc
-- col returncode
col ses_actions for a16 trunc
col obj_privilege for a16 trunc
col sys_privilege for a20 trunc
col audit_option for a20 trunc
col grantee for a6 trunc
col ts for a10 trunc
select username, owner, obj_name, action_name, priv_used,
 audit_option, returncode, ses_actions,
 obj_privilege,sys_privilege, admin_option,grantee,
 to_char(timestamp,'MMDDHH24MISS') ts
from dba_audit_trail
where to_char(timestamp,'YYYYMMDD HH24MISS')>'20130901 131840'
order by to_char(timestamp,'YYYYMMDD HH24MISS');

