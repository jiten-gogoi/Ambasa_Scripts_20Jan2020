-- Purpose:     This script lists the hints associated with a given outline.
select name, hint from dba_outline_hints
where name like nvl('&name',name)
/
