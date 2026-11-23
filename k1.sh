kill -9 `ps -ef | grep -i smon | grep -i ambasa | awk '{print $2}'`
