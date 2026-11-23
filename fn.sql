col tablespace_name for a15
col file_name for a60
set lines 200

select tablespace_name,file_name,bytes/(1024*1024) from dba_data_files where tablespace_name='&tablespace_name';
l
