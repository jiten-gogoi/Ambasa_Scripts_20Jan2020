select file#, block#, count(*)
from v$bh
group by file#, block#
having count(*) > 3
order by 3;
/

select owner, segment_name
            from dba_extents
            where file_id = &file
                and &block between block_id and block_id+blocks-1;

