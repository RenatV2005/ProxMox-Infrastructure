#!/bin/bash

#################################
# Paths
#################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

BACKUP_DIR="$PROJECT_ROOT/backups"

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

        cd "$PROJECT_ROOT/documentation-stack" || exit 1
        docker compose down

        echo
        echo "Saving current BookStack..."

        mv "$PROJECT_ROOT/documentation-stack/bookstack-app" \
           "$PROJECT_ROOT/documentation-stack/bookstack-app.old-$OLD_DATE"

        echo
        echo "Restoring backup..."

        tar -xzf "$LATEST_BOOKSTACK" -C "$PROJECT_ROOT/documentation-stack"

        echo
        echo "Starting BookStack..."

        docker compose up -d

        echo
        echo "Waiting for services..."

        sleep 15

        echo
        echo "Running Health Check..."

        "$PROJECT_ROOT/infrastructure-tools/healthcheck.sh"

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

        cd "$PROJECT_ROOT/documentation-stack" || exit 1
        docker compose down

        echo
        echo "Starting MariaDB..."

        docker compose up -d mariadb-datenbank

        echo
        echo "Waiting for MariaDB..."

        sleep 10

        echo
        echo "Importing MariaDB Backup..."

        docker compose exec -T mariadb-datenbank \
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

        "$PROJECT_ROOT/infrastructure-tools/healthcheck.sh"

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

        cd "$PROJECT_ROOT/git-platform" || exit 1
        docker compose down

        echo
        echo "Starting PostgreSQL..."

        docker compose up -d postgres

        echo
        echo "Waiting for PostgreSQL..."

        sleep 10

        echo
        echo "Importing PostgreSQL Backup..."

        docker compose exec -T postgres \
        psql -U gitea gitea \
        < "$LATEST_POSTGRES"

        POSTGRES_STATUS=$?

        echo
        echo "Starting Gitea..."

        docker compose up -d

        echo
        echo "Waiting for services..."

        sleep 15

        echo
        echo "Running Health Check..."

        "$PROJECT_ROOT/infrastructure-tools/healthcheck.sh"

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
