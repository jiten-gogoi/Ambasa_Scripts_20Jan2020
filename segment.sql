select segment_name,segment_type,owner,bytes/1024/1024 from dba_segments where segment_name='&SEGMENT_NAME';
l
