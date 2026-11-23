set linesize 180
set pagesize 60
col group_number format 99 heading "Grp|Num"
col instance_name format a8 heading "Inst|Nm"
col db_name format a8 heading "DB|Name"
col cluster_name format a20 heading "Clu|Nm"
col status format a9 heading "Status"
col state format a7 heading "State"
col name format a7 heading "DG Name"
col type format a6 heading "ASM|Redun-|dancy"
col total_mb format 999,999 heading "Total|MB"
col allocation_unit_size format 9,999,999 heading "Alloc|Unit|Sz"
col offline_disks format 99 heading "Offline|Disks"
col voting_files format a7 heading "Voting|Files"
select ac.group_number
, ac.instance_name
, ac.db_name
, ac.cluster_name
, ac.status
, ac.con_id
, adg.sector_size
, adg.block_size
, adg.allocation_unit_size
, adg.state
, adg.type
, adg.total_mb
, adg.offline_disks
, adg.voting_files
from v$asm_diskgroup adg
, v$asm_client ac
where adg.group_number = ac.group_number
order by 1, 2;
l
