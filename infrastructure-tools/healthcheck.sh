#!/bin/bash

#################################
# Paths
#################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "======================================"
echo " Infrastructure Health Check"
echo "======================================"
echo

#################################
# HTTP Services
#################################

BOOKSTACK=$(curl -o /dev/null -s -w "%{http_code}" http://127.0.0.1:6875)
GRAFANA=$(curl -o /dev/null -s -w "%{http_code}" http://127.0.0.1:3000)
CADVISOR=$(curl -o /dev/null -s -w "%{http_code}" http://127.0.0.1:8080)
NODEEXPORTER=$(curl -o /dev/null -s -w "%{http_code}" http://127.0.0.1:9100)
PROMETHEUS=$(curl -o /dev/null -s -w "%{http_code}" http://127.0.0.1:9090)
GITEA=$(curl -o /dev/null -s -w "%{http_code}" http://127.0.0.1:3001)
REVERSEPROXY=$(curl -o /dev/null -s -w "%{http_code}" http://127.0.0.1:80)
NGINX=$(curl -k -o /dev/null -s -w "%{http_code}" https://127.0.0.1)

#################################
# Database Health
#################################

cd "$PROJECT_ROOT/documentation-stack" || exit 1

MARIADB=$(docker compose exec -T mariadb-datenbank \
sh -c 'mariadb-admin ping -u root -p"$MARIADB_ROOT_PASSWORD"')

cd "$PROJECT_ROOT/git-platform" || exit 1

POSTGRES=$(docker compose exec -T postgres \
pg_isready)

#################################
# Output
#################################

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
