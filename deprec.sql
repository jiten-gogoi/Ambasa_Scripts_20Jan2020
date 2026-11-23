select p.name,sp.value
from v$parameter p, v$spparameter sp
where sp.name=p.name
and p.isdeprecated='TRUE'
and sp.isspecified='TRUE';
l
