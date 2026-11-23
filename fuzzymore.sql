select hxfil file#, substr(hxfnm, 1, 50) name, fhscn checkpoint_change#, fhafs Absolute_Fuzzy_SCN, max(fhafs) over () Min_PIT_SCN from x$kcvfh where fhafs!=0 ;
l
