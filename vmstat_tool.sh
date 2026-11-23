#!/bin/sh
#vmstat_tool.sh
#vmstat parser script. Makes the information easily readable.
#Ensure that the number of loops and delay parameters
#were passed to this script
if [ $# -ne 2 ]
then
echo "Usage: $0 "
exit
fi
export DLAY=$1
export LPCNT=$2
#export DLAY=$2
c=0
while [ "$c" -lt $LPCNT ]
do
date
vmstat | tail -n 1 | awk '{printf("%d processes are waiting\n%d processes are blocked\n%d virtual memory used, %d idle memory, %d buffer memory, %d cache memory\n%d memory swapped in from disk, %d memory swapped out to disk\n%d blocks per second written\n%d blocks per second read\n%d interrupts per second\n%d context switches per second\nCPU usage: %d%% (user, non-kernel), %d%% (system, kernel), %d%% idle, %d%% wait\n\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16)}'
sleep $DLAY
c=$((c+1))
done
