#!/bin/bash

# Check if a target and ports were provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <target> <ports>"
  exit 1
fi

# Set the target and ports as arguments
TARGET=$1
PORTS=$2


echo "use auxiliary/scanner/portscan/tcp" > mscan_probe.rc
echo "set RHOSTS $TARGET" >> mscan_probe.rc
echo "set PORTS $PORTS" >> mscan_probe.rc
echo "run" >> mscan_probe.rc

msfconsole -r mscan_probe.rc
