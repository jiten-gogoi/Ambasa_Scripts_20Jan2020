select substr(segment_name,1,30), blocks from dba_segments where upper(segment_name) like upper('%&segment_name%');
