#!/bin/bash
# ReduceSwapUsage.sh
echo "Your current swap is used when there is only `cat /proc/sys/vm/swappiness`% of ram left" 
echo "Reducing swap usage..."
sudo sysctl vm.swappiness=10
echo "Disabling swap..."
swapoff -a 
echo "Enabling swap to apply changes..."
swapon -a 
echo "Now swap will be used when there is only `cat /proc/sys/vm/swappiness`% of ram left"