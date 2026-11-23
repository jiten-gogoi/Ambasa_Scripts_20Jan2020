SELECT name NAME, partition_name PARTITION_NAME,
(br_rows_len*100)/(br_blk_len*br_blks) BRANCH_UTILIZATION,
((lf_rows_len - del_lf_rows_len)*100)/(lf_blk_len*lf_blks) LEAF_UTILIZATION,
decode (SIGN(ceil(log(br_blk_len/(br_rows_len/br_rows),
lf_blk_len/((lf_rows_len - del_lf_rows_len)/(lf_rows - del_lf_rows))))
+ 1 - height), -1, 'YES', 'NO') CAN_REDUCE_LEVEL
from INDEX_STATS;