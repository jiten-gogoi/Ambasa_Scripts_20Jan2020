select 'alter user "'||du.username||'" identified by values '''||u.password||''';' ambasa_maintain_same_password
from dba_users du, sys.user$ u
where du.username = upper('&username')
and u.user# = du.user_id;

