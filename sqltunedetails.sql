accept table_name prompt 'Enter table_name: '

set pagesize 999
set linesize 132
set verify off

column column_name format a40
column value format a65
column object_name format a60

select owner, object_name, object_type
from dba_objects
where upper(object_name) = upper('&table_name')
order by owner, object_name, object_type
/

accept owner prompt 'Enter table owner: '

REM
REM Table Definition
REM
describe &owner..&table_name

REM
REM Index Definition
REM
select distinct c.index_name, i.uniqueness, c.column_name, c.column_position
from dba_ind_columns c, dba_indexes i
where upper(c.table_name) = upper('&table_name')
and upper(c.table_owner) = upper('&owner')
and c.index_name = i.index_name
and c.index_owner = i.owner
order by index_name, column_position
/

REM
REM Column Definitions
REM
select column_name, num_distinct, num_nulls, num_buckets, density, sample_size
from dba_tab_columns
WHERE upper(owner) = upper('&owner')
AND upper(table_name) = upper('&table_name')
order by column_name
/

REM
REM Existing Histograms
REM
SELECT column_name, endpoint_number, endpoint_value
FROM dba_histograms
WHERE upper(table_name) = upper('&table_name')
AND upper(owner) = upper('&owner')
ORDER BY column_name, endpoint_number
/

REM
REM Row Counts
REM
SELECT table_name, num_rows, degree, last_analyzed
FROM dba_tables
WHERE upper(owner) = upper('&owner')
AND upper(table_name) = upper('&table_name')
/ 

REM
REM Table and Indexes - Segment Sizes
REM
column segment_name format a50
SELECT segment_name, segment_type, SUM(bytes)/1024/1024 size_mb
FROM dba_segments
WHERE upper(owner) = upper('&owner')
AND upper(segment_name) = upper('&table_name')
OR segment_name in (
      select index_name from dba_indexes
      where upper(table_name) = upper('&table_name')
      and upper(table_owner) = upper('&owner'))
GROUP BY segment_name, segment_type
/




REM uncomment this line if you want "live" row counts 
REM  - for large tables this could run for a while and cause performance problems
REM
REM select count(*) from "&owner"."&table_name"
REM /
