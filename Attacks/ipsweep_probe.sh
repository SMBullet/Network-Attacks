#!/bin/bash

# Define the IP range to scan
start_ip="192.168.100.1"
end_ip="192.168.100.100"


start=$(echo $start_ip | awk -F. '{print $4}')
end=$(echo $end_ip | awk -F. '{print $4}')


for ((i=start; i<=end; i++)); do
	# don't forget to change the current ip mask
    current_ip="192.168.100.$i"
    echo "Scanning IP: $current_ip"
    
	ping -c 1 $current_ip > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Probe successful for $current_ip"
    
    fi
done

