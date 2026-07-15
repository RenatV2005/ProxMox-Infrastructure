#!/bin/bash

echo "======================================"
echo " Infrastructure Health Check"
echo "======================================"
echo

# HTTP SERVICES

BOOKSTACK=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.0.180:6875)
GRAFANA=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.0.180:3000)
CADVISOR=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.0.180:8080)
NODEEXPORTER=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.0.180:9100)
PROMETHEUS=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.0.180:9090)
GITEA=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.0.180:3001)
REVERSEPROXY=$(curl -o /dev/null -s -w "%{http_code}" http://192.168.0.180:80)
NGINX=$(curl -k -o /dev/null -s -w "%{http_code}" https://192.168.0.180)

# DATABASES

MARIADB=$(docker exec docker-compose2-mariadb-datenbank-1 \
sh -c 'mariadb-admin ping -u root -p"$MARIADB_ROOT_PASSWORD"')

POSTGRES=$(docker exec docker-compose3-postgres-1 \
pg_isready)

echo "BookStack      : $BOOKSTACK"
echo "Grafana        : $GRAFANA"
echo "cAdvisor       : $CADVISOR"
echo "Node Exporter  : $NODEEXPORTER"
echo "Prometheus     : $PROMETHEUS"
echo "Gitea          : $GITEA"
echo "Reverse Proxy  : $REVERSEPROXY"
echo "Nginx          : $NGINX"
echo
echo "MariaDB        : $MARIADB"
echo "PostgreSQL     : $POSTGRES"
