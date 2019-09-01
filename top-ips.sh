#!/bin/bash

read -p "Domain name: " domain
read -p "Where to save final report? " save
read -p "Path to web server log file: " logFile

[ ! -d $save ] && mkdir -p $save

if [[ -f $logFile ]]; then
	echo "Processing log for $domain ..."
	touch $save/$domain.txt
	awk '{ print $1}' $logFile | sort  | uniq -c  | sort -nr > $save/$domain.txt
	echo "Report written to $save/$domain.txt"
fi
