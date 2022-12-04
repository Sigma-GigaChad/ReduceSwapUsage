#!/bin/bash
# check if you are root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
# check if swap is enabled
if [ "$(swapon -s | wc -l)" == "1" ]; then
   echo "Swap is not enabled"
   exit 0
fi
# check if /proc/sys/vm/overcommit_memory is set to 1
echo "Your current swap is used when there is only `cat /proc/sys/vm/swappiness`% of ram left" 
echo "Reducing swap usage..."
sudo sysctl vm.swappiness=10
echo "Disabling swap..."
swapoff -a 
echo "Enabling swap to apply changes..."
swapon -a 
echo "Now swap will be used when there is only `cat /proc/sys/vm/swappiness`% of ram left"