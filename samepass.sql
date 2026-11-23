select 'alter user "'||du.username||'" identified by values '''||u.password||''';' AMBASA_MAINTAIN_SAME_PASSWORD from dba_users du, sys.user$ u where du.username = upper('&username')
and u.user# = du.user_id;
