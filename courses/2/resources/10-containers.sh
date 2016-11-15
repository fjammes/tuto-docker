#!/bin/bash

# cat /proc/meminfo

serverCount=10
startDate=$(date)
for n in $(seq 1 1 $serverCount)
do
	hostPort=$(($n + 10000))
	provider="World #$n"
	echo "Starting $n. Host Port: $hostPort, Message: $provider"
	docker run -d -p $hostPort:5000 -e "PROVIDER=$provider" training/webapp
done
echo
echo Started $n containers. Start time: $startDate, end time: $(date)

# Stop all: docker stop $(docker ps -q)
# Remove all stopped: docker rm $(docker ps -aq)

# Test run:
#   free –m: 1494
#   1 Container: 1480
#   100 Containers: 124
