
select fuzzy, status, error, recover, checkpoint_change#, checkpoint_time, count(*) from v$datafile_header group by fuzzy, status, error, recover, checkpoint_change#, checkpoint_time ;

select hxfil file#, substr(hxfnm, 1, 50) name, fhscn checkpoint_change#, fhafs Absolute_Fuzzy_SCN, max(fhafs) over () Min_PIT_SCN from x$kcvfh where fhafs!=0 ;
