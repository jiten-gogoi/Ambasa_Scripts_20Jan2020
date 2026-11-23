rem	Description: Disable automatic statistics collection
BEGIN
   dbms_auto_task_admin.enable
             (client_name=> 'auto optimizer stats collection',
              operation        => NULL,
              window_name      => NULL
             );
END;
