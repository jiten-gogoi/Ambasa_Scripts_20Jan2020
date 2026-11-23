select ses_addr,start_time from V$transaction where status='ACTIVE' order by start_time desc;
