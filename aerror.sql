set line 200
col DEST_NAME for a60
col BINDING for a10

select DEST_ID,DEST_NAME,STATUS,BINDING,ERROR from v$ARCHIVE_DEST where status<>'INACTIVE';
l
