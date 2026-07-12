#!/bin/bash

BACKUP_DIR="/home/renatubuntu/documentation/backups"

OLD_DATE=$(date +"%Y-%m-%d_%H-%M-%S")

LATEST_BOOKSTACK=$(ls -t "$BACKUP_DIR"/bookstack-app-*.tar.gz | head -n 1)
LATEST_MARIADB=$(ls -t "$BACKUP_DIR"/bookstack-db-*.sql | head -n 1)
LATEST_POSTGRES=$(ls -t "$BACKUP_DIR"/gitea-db-*.sql | head -n 1)

echo "======================================"
echo " Restore Manager"
echo "======================================"
echo

echo "Latest Backups"
echo

echo "BookStack:"
echo "$LATEST_BOOKSTACK"
echo

echo "MariaDB:"
echo "$LATEST_MARIADB"
echo

echo "PostgreSQL:"
echo "$LATEST_POSTGRES"
echo

echo "======================================"
echo

echo "1) Restore BookStack"
echo "2) Restore MariaDB"
echo "3) Restore PostgreSQL"
echo "4) Restore Everything"
echo "5) Exit"
echo

read -p "Select: " OPTION

case "$OPTION" in

1)

    echo
    echo "BookStack Restore selected."

    read -p "Continue? (yes/no): " CONFIRM

    if [ "$CONFIRM" = "yes" ]
    then

        echo
        echo "Stopping BookStack..."

        cd /home/renatubuntu/documentation/docker-compose2
        docker compose down

        echo
        echo "Saving current BookStack..."

        mv /home/renatubuntu/documentation/docker-compose2/bookstack-app \
        /home/renatubuntu/documentation/docker-compose2/bookstack-app.old-$OLD_DATE

        echo
        echo "Restoring backup..."

        tar -xzf "$LATEST_BOOKSTACK" -C /

        echo
        echo "Starting BookStack..."

        docker compose up -d

        echo
        echo "Waiting for services..."

        sleep 15

        echo
        echo "Running Health Check..."

        /home/renatubuntu/documentation/tools/healthcheck.sh

        echo
        echo "======================================"
        echo " BookStack Restore Finished"
        echo "======================================"

    else

        echo
        echo "Restore cancelled."

    fi
;;

2)

    echo
    echo "MariaDB Restore selected."

    read -p "Continue? (yes/no): " CONFIRM

    if [ "$CONFIRM" = "yes" ]
    then

        echo
        echo "Stopping BookStack Stack..."

        cd /home/renatubuntu/documentation/docker-compose2
        docker compose down

        echo
        echo "Importing MariaDB Backup..."

        docker compose up -d mariadb-datenbank

        echo
        echo "Waiting for MariaDB..."

        sleep 10

        docker exec -i docker-compose2-mariadb-datenbank-1 \
        sh -c 'mariadb -u root -p"$MARIADB_ROOT_PASSWORD" bootstackdb' \
        < "$LATEST_MARIADB"

        MARIADB_STATUS=$?

        echo
        echo "Starting BookStack..."

        docker compose up -d

        echo
        echo "Waiting for services..."

        sleep 15

        echo
        echo "Running Health Check..."

        /home/renatubuntu/documentation/tools/healthcheck.sh

        echo

        if [ $MARIADB_STATUS -eq 0 ]
        then
            echo "======================================"
            echo " MariaDB Restore Finished Successfully"
            echo "======================================"
            exit 0
        else
            echo "======================================"
            echo " MariaDB Restore FAILED"
            echo "======================================"
            exit 1
        fi

    else

        echo
        echo "Restore cancelled."

    fi
;;

3)

    echo
    echo "PostgreSQL Restore selected."

    read -p "Continue? (yes/no): " CONFIRM

    if [ "$CONFIRM" = "yes" ]
    then

        echo
        echo "Stopping Gitea Stack..."

        cd /home/renatubuntu/documentation/docker-compose3
        docker compose down

        echo
        echo "Starting PostgreSQL..."

        docker compose up -d postgres

        echo
        echo "Waiting for PostgreSQL..."

        sleep 10

        echo
        echo "Importing PostgreSQL Backup..."

        docker exec -i docker-compose3-postgres-1 \
        psql -U gitea gitea \
        < "$LATEST_POSTGRES" >/dev/null 2>&1

        POSTGRES_STATUS=$?

        echo
        echo "Starting Gitea..."

        docker compose up -d

        echo
        echo "Waiting for services..."

        sleep 15

        echo
        echo "Running Health Check..."

        /home/renatubuntu/documentation/tools/healthcheck.sh

        echo

        if [ $POSTGRES_STATUS -eq 0 ]
        then
            echo "======================================"
            echo " PostgreSQL Restore Finished Successfully"
            echo "======================================"
            exit 0
        else
            echo "======================================"
            echo " PostgreSQL Restore FAILED"
            echo "======================================"
            exit 1
        fi

    else

        echo
        echo "Restore cancelled."

    fi
;;

4)

    echo
    echo "Restore Everything will be implemented after"
    echo "BookStack, MariaDB and PostgreSQL have all"
    echo "been individually tested."

;;

5)

    echo
    echo "Exit."

;;

*)

    echo
    echo "Invalid option."

;;

esac
