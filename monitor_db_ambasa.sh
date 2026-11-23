#!/bin/bash
while true; do sar 1 5; vmstat 1 5 ; sqlplus / as sysdba @cpu1.sql ; sleep 1; done;
