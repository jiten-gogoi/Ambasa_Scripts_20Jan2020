define opt_ind_cache = &1
ALTER SESSION SET tracefile_identifier = 'opt_ind_cache_&opt_ind_cache';
ALTER SESSION SET optimizer_index_caching = &opt_ind_cache;
ALTER SESSION SET events = '10053 TRACE NAME CONTEXT FOREVER, LEVEL 1';
EXPLAIN PLAN FOR
SELECT COUNT (*)
FROM t1;
exit
