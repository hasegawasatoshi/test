#!/bin/bash


while :
do
	FILENAME="resource_`date +%F_%H-%M-%S`.log"
	ps auxwS >> $FILENAME
	vmstat -t >> $FILENAME
	find -name "resource_*.log" -mmin +3 -exec rm {} \;

	CPU_USAGE=`vmstat | tail -n 1 | awk '{ print $13 }'`
	if [ $CPU_USAGE -gt 1 ]; then
		exit
	fi
	sleep 3
done

