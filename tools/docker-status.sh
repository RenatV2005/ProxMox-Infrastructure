#!/bin/bash

RUNNING_CONTAINERS=$(docker ps -q | wc -l)

STOPPED_CONTAINERS=$(docker ps -aq --filter "status=exited" | wc -l)

echo "=============================="
echo " Docker Infrastruktur Status"
echo "=============================="
echo
echo "Running Container : $RUNNING_CONTAINERS"
echo "Stopped Container : $STOPPED_CONTAINERS"

