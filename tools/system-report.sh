#!/bin/bash

echo "======================================"
echo "        System Report"
echo "======================================"
echo

echo "Hostname:"
hostname
echo

echo "Operating System:"
grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'
echo

echo "Kernel:"
uname -r
echo

echo "Uptime:"
uptime -p
echo

echo "CPU:"
lscpu | grep "Model name"
echo

echo "Memory:"
free -h
echo

echo "Disk Usage:"
df -h /
echo

echo "IP Address:"
hostname -I
echo

echo "Running Docker Containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo

echo "Docker Images:"
docker images
echo
