#!/bin/bash

trap ctrl_c INT  # Handle CTRL-C request
response="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\nServer: Simple Bash Server\r\nDate: $(date)\r\n"

usage () {
	echo -e "Usage: bash $0 [port]"
}

ctrl_c () {
	echo -e "\033[91mShutdown...\033[0m"
	exit
}

if [ $# -ne 1 ]; then  # $# is number of passed arguments to script
	usage
	exit

else
	echo -e "Server started on port $1\n"
	while true; do
	echo -e $response | nc -l -p $1
	done
fi
