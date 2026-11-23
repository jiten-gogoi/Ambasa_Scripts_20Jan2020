while true loop
do
 echo -n "`date` : "
 netstat -s -a tcp | grep tcpRetrans
 sleep 1
done;
