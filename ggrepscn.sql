col group_name for a20
col log_bsn for a10
col log_csn for a10
col log_cmplt_csn for a15
select group_name,rba,log_bsn,log_csn,log_cmplt_csn from gguser.ggs_checkpoint;
