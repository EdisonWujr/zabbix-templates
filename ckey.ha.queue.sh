#!/bin/bash
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

echo "show stat" |socat /usr/local/haproxy/haproxy.sock stdio|grep "\<$1\>"|grep -v "^FRONTEND"|grep -v "^BACKEND"|awk -F "," '{print $3}'
