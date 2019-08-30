#!/bin/bash

read -p "Domain name: " DOMAIN
read -p "Where to save final report? " SAVE
read -p "Path to web server log file: " LOGFILE

[ ! -d $SAVE ] && mkdir -p $SAVE

if [[ -f $LOGFILE ]]; then
	echo "Processing log for $DOMAIN ..."
	touch $SAVE/$DOMAIN.txt
	awk '{ print $1}' $LOGFILE | sort  | uniq -c  | sort -nr > $SAVE/$DOMAIN.txt
	echo "Report written to $SAVE/$DOMAIN.txt"
fi
