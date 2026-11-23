-- Purpose:     Find the trace file name 11g
SELECT value 
FROM v$diag_info 
WHERE name = 'Default Trace File';
