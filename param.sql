set sqlbl on
set lines 200
col name for a30
col value for a50
select name,value from v$parameter where name in ('db_file_name_convert','log_file_name_convert',
'db_name','db_unique_name','db_domain','service_names','log_archive_config','log_archive_dest_1',
'log_archive_dest_2','db_recovery_file_dest','db_recovery_file_dest_size',
'fal_server','local_listener','instance_name');
