COLUMN username FORMAT A10
COLUMN owner    FORMAT A10
COLUMN obj_name FORMAT A10
COLUMN extended_timestamp FORMAT A35
set lines 200
set sqlbl on
SELECT username,
       extended_timestamp,
       owner,
       obj_name,
       action_name,SQL_TEXT
FROM   dba_audit_trail
WHERE  owner = 'AUDIT_TEST'
ORDER BY timestamp;
l


