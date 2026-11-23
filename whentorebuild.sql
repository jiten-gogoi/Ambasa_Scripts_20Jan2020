ANALYZE INDEX ambasa_random_test3_c1_idx VALIDATE STRUCTURE;
select br_rows,br_blks,name,height,lf_blks,lf_rows,del_lf_rows,(del_lf_rows/lf_rows)*100,used_space,pct_used FROM INDEX_STATS;
