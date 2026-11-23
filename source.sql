select owner,name,type,line,text from dba_source where upper(name) like upper('%&name%');
