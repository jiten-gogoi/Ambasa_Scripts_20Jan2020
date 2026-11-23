set lines 200
col c1 for 999
col c2 for a10

select 	  dbms_rowid.rowid_object(rowid) "object_id",
          dbms_rowid.rowid_relative_fno(rowid) "file",
          dbms_rowid.rowid_block_number(rowid) "block",
          dbms_rowid.rowid_row_number(rowid) "row" ,a.* from &table_name a
/
