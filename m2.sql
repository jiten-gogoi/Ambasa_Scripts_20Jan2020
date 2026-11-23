select tablespace_name, status from dba_tablespaces where tablespace_name in (select tablespace_name from 
dba_data_files where file_id=&file_id);
