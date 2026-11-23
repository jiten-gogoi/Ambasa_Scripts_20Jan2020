select file#, status, enabled, substr(name, 1, 70) from v$datafile where name like '%MISSING%' ;
