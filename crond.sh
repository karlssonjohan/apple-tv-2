#!/bin/sh

PROGRAM=`basename $0`
USAGE="$PROGRAM HH:MM <command>"
LOG_DIR=/var/log


if [ $# -lt 2 ]; then
	echo "USAGE: $USAGE"
	exit 1
fi
time=$1
command=$2

while true
do
	sleep 10
	current_time=`date | awk '{print $4}' | awk -F: '{print $1":"$2}'`
	if [ $current_time = $time ]; then
		sleep 60
		eval $command
		echo "executed $command" > $LOG_DIR/$PROGRAM.log
	fi
done
