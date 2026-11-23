set lines 200
col group_name for a10
col log_bsn for a10
col log_csn for a10
col log_cmplt_csn for a10
select group_name,log_bsn,log_csn,log_cmplt_csn from gguser.GGS_CHECKPOINT;
