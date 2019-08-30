#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: bash $0 /path/to/file"
	exit 0
fi

FILE=$1

extract () {
	# We can simply use from dtrx tool to extract any archived file with any extension :)
	# Check dtrx installed or not
	if hash dtrx 2> /dev/null; then
		dtrx $1
	else
		echo "Please install dtrx: sudo apt-get install dtrx"
		#exit 0
	fi
}

extract $FILE
