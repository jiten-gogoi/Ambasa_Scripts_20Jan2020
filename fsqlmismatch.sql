select sql_id,child_number, address, child_address, optimizer_mismatch, bind_mismatch, translation_mismatch,optimizer_mode_mismatch
from v$sql_shared_cursor where sql_id='&sql_id';
l

