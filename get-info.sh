#!/bin/bash

# Get all domains
domains=$@

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 test.com example.com ..."
	exit 1
fi

for d in $domains
do
	ip=$(host $d | grep 'has add' | head -1 | awk '{ print $4}')
	[ "$ip" == "" ] && { echo "Error: An error occurred!"; continue; }
	echo -e "\033[93mGetting information about domain: $d [ $ip ] \033[0m"
	whois "$ip" | egrep -w 'OrgName:|City:|Country:|OriginAS:|NetRange:'
	echo ""
done
