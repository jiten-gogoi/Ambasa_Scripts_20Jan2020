col awr_status  format a80 heading 'Warning: Non Default AWR Setting!';
select  'Snapshot interval is ' || round(w.snapint_num/60) || ' minutes and '
        || 'Retention is ' || round(w.retention_num/86400) || ' days' as awr_status
from    wrm$_wr_control w
where   (w.snapint_num <> 3600
         or w.retention_num <> 604800);
