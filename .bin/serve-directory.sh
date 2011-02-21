#!/bin/bash
port=8000
if [ $? == 1 ];then
    dir=$1
else
    dir="."
fi

ip=`python -c "import socket; print socket.gethostbyname(socket.gethostname()),"`

cd $dir
dir=`pwd`
echo "Serving directory $dir on $ip:$port"
python -m SimpleHTTPServer $port
