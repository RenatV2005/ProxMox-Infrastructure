#!/bin/bash

#################################
# Paths
#################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$PROJECT_ROOT/backups"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$BACKUP_DIR"

echo "======================================"
echo " Backup Manager"
echo "======================================"
echo

#################################
# BookStack
#################################

echo "Creating BookStack backup..."

tar -czf "$BACKUP_DIR/bookstack-app-$DATE.tar.gz" \
"$PROJECT_ROOT/documentation-stack/bookstack-app"

BOOKSTACK_STATUS=$?

#################################
# MariaDB
#################################

echo "Creating MariaDB backup..."

cd "$PROJECT_ROOT/documentation-stack" || exit 1

docker compose exec -T mariadb-datenbank \
sh -c 'mariadb-dump -u root -p"$MARIADB_ROOT_PASSWORD" bootstackdb' \
> "$BACKUP_DIR/bookstack-db-$DATE.sql"

MARIADB_STATUS=$?

#################################
# PostgreSQL
#################################

echo "Creating PostgreSQL backup..."

cd "$PROJECT_ROOT/git-platform" || exit 1

docker compose exec -T postgres \
pg_dump -U gitea gitea \
> "$BACKUP_DIR/gitea-db-$DATE.sql"

POSTGRES_STATUS=$?

echo
echo "======================================"
echo " Backup Summary"
echo "======================================"

if [ $BOOKSTACK_STATUS -eq 0 ]
then
    echo "BookStack  : SUCCESS"
else
    echo "BookStack  : FAILED"
fi

if [ $MARIADB_STATUS -eq 0 ]
then
    echo "MariaDB    : SUCCESS"
else
    echo "MariaDB    : FAILED"
fi

if [ $POSTGRES_STATUS -eq 0 ]
then
    echo "PostgreSQL : SUCCESS"
else
    echo "PostgreSQL : FAILED"
fi

echo

#################################
# Overall Result
#################################

if [ $BOOKSTACK_STATUS -eq 0 ] && \
   [ $MARIADB_STATUS -eq 0 ] && \
   [ $POSTGRES_STATUS -eq 0 ]
then
    echo "Overall Status : SUCCESS"
    echo "======================================"
    exit 0
else
    echo "Overall Status : FAILED"
    echo "======================================"
    exit 1
fi
