select dbms_rowid.rowid_object(rowid) "object",
          dbms_rowid.rowid_relative_fno(rowid) "file",
          dbms_rowid.rowid_block_number(rowid) "block",
          dbms_rowid.rowid_row_number(rowid) "rowno" ,a.* from &table_name a
 /
