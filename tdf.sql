select tablespace_name,FILE_NAME,bytes/1024/1024/1024 "SIZE GB" from dba_data_files where file_name like '&File_Name%'
and tablespace_name='&TABLESPACE_NAME'
/
