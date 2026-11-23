select
     dbms_rowid.rowid_relative_fno(rowid) File#,
     dbms_rowid.rowid_block_number(rowid) Block#,
     count(1)
from &table_name
  group by
     dbms_rowid.rowid_relative_fno(rowid),
     dbms_rowid.rowid_block_number(rowid)
  order by 1,2;

