#!/bin/bash

BACKUP_DIR="/home/renatubuntu/documentation/backups"

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
/home/renatubuntu/documentation/documentation-stack/bookstack-app

BOOKSTACK_STATUS=$?

#################################
# MariaDB
#################################

echo "Creating MariaDB backup..."

docker exec docker-compose2-mariadb-datenbank-1 \
sh -c 'mariadb-dump -u root -p"$MARIADB_ROOT_PASSWORD" bootstackdb' \
> "$BACKUP_DIR/bookstack-db-$DATE.sql"

MARIADB_STATUS=$?

#################################
# PostgreSQL
#################################

echo "Creating PostgreSQL backup..."

docker exec docker-compose3-postgres-1 \
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
