#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: bash $0 test.zip example.tar ..."
	exit 0
fi

file=$@

extract () {
	# We can simply use from dtrx tool to extract any archived file with any extension :)
	# Check dtrx installed or not
	if hash dtrx 2> /dev/null; then
		dtrx $@
	else
		echo "Please install dtrx: sudo apt-get install dtrx"
		#exit 0
	fi
}

extract $file
