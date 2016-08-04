#!/bin/bash 
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
printf  '{\n'
printf  '\t"data":[\n'
export LINE=$(echo "show stat" |socat /usr/local/haproxy/haproxy.sock stdio|grep -v "^#"|grep -v "^admin_stats"|awk -F "," '{print $2}'|grep -v "^FRONTEND"|grep -v "^BACKEND"|grep -v "^$"|wc -l)
export N=0
#printf  '\t\t{\n'
for i in $(echo "show stat" |socat /usr/local/haproxy/haproxy.sock stdio|grep -v "^#"|grep -v "^admin_stats"|awk -F "," '{print $2}'|grep -v "^FRONTEND"|grep -v "^BACKEND");
        do printf "\t\t\t{\"{#SNAME}\":\"$i\"}";
	N=$(($N+1))
	if [ $N -eq $LINE ];
	then
			printf '\n'
	else
		printf ',\n'
	fi
	done;
printf ']}\n'
