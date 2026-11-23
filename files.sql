select name from v$datafile
union
select name from v$controlfile
union
select member from v$logfile
union
select name from v$tempfile;
