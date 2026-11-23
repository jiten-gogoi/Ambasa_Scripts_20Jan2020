#!/bin/bash
rmanlog=`date '+rman_backup_ambasa_level0_%d%m%y%H%M%S'`.log
rmanbkp=`date '+rman_backup_ambasa_level0_%d%m%y%H%M%S'`
$ORACLE_HOME/bin/rman target=/ log=/u02/app/oracle/test/$rmanlog << EOF
run
{
allocate channel ch1 type disk connect sys/sys;
backup  datafile 4 format '/u02/app/oracle/test/%U_$rmanbkp';
release channel ch1;
}
EOF
