set sqlbl on
select inst_id,tbs,SMALL_READ_MEGABYTES,SMALL_READ_REQS,SMALL_READ_SERVICETIME,
        SMALL_SYNC_READ_LATENCY,LARGE_READ_MEGABYTES,LARGE_READ_REQS,LARGE_READ_SERVICETIME,
        SMALL_WRITE_MEGABYTES,SMALL_WRITE_REQS,SMALL_WRITE_SERVICETIME,LARGE_WRITE_MEGABYTES,LARGE_WRITE_REQS,LARGE_WRITE_SERVICETIME,interval,file_no,SMALL_SYNC_READ_REQS
	from
	(
	select f.inst_id as inst_id,t.name as tbs,SMALL_READ_MEGABYTES,SMALL_READ_REQS,SMALL_READ_SERVICETIME,
	SMALL_SYNC_READ_LATENCY,LARGE_READ_MEGABYTES,LARGE_READ_REQS,LARGE_READ_SERVICETIME,
	SMALL_WRITE_MEGABYTES,SMALL_WRITE_REQS,SMALL_WRITE_SERVICETIME,LARGE_WRITE_MEGABYTES,LARGE_WRITE_REQS,LARGE_WRITE_SERVICETIME,$interval as interval,file_no,SMALL_SYNC_READ_REQS 
	from GV\$IOSTAT_FILE f,gv\$tablespace t, gv\$datafile d 
	where f.inst_id=t.inst_id
	and d.inst_id=f.inst_id
	and d.file#=f.file_no
	and d.ts#=t.ts#
	and f.filetype_name='Data File'
	union all
        select f.inst_id,t.name as tbs,SMALL_READ_MEGABYTES,SMALL_READ_REQS,SMALL_READ_SERVICETIME,
        SMALL_SYNC_READ_LATENCY,LARGE_READ_MEGABYTES,LARGE_READ_REQS,LARGE_READ_SERVICETIME,
        SMALL_WRITE_MEGABYTES,SMALL_WRITE_REQS,SMALL_WRITE_SERVICETIME,LARGE_WRITE_MEGABYTES,LARGE_WRITE_REQS,LARGE_WRITE_SERVICETIME,$interval as interval,file_no,SMALL_SYNC_READ_REQS
        from GV\$IOSTAT_FILE f,gv\$tablespace t, gv\$tempfile d
        where f.inst_id=t.inst_id
        and d.inst_id=f.inst_id
        and d.file#=f.file_no
        and d.ts#=t.ts#
	and f.filetype_name='Temp File'
	) where 1=1 
        ;
