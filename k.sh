ps -aef |grep d.bin| grep -v grep|awk {'print $2'}|xargs kill -9
