#!/bin/bash
 
#this script take an ip address, start port and end port 

scan_ports() {
    ip_address=$1
    start_port=$2
    end_port=$3

 
    for ((port=start_port; port<=end_port; port++)); do
        timeout 1 bash -c "echo >/dev/tcp/$ip_address/$port" 2>/dev/null &&
            echo "Port $port is open" 
    done
}

read -p "Enter the IP address to scan: " ip_address
read -p "Enter the starting port: " start_port
read -p "Enter the ending port: " end_port

echo "Scanning ports $start_port to $end_port on $ip_address..."
scan_ports "$ip_address" "$start_port" "$end_port"

