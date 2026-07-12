#!/bin/bash

COMPOSE_DIR="/home/renatubuntu/documentation"

COMPOSES=(
docker-compose
docker-compose2
docker-compose3
docker-compose4
docker-compose5
)

echo "======================================"
echo " Compose Manager"
echo "======================================"

if [ "$1" = "down" ]
then

    for COMPOSE in "${COMPOSES[@]}"
    do
        echo
        echo "Stopping: $COMPOSE"

        cd "$COMPOSE_DIR/$COMPOSE" && docker compose down
    done

elif [ "$1" = "up" ]
then

    for COMPOSE in "${COMPOSES[@]}"
    do
        echo
        echo "Starting: $COMPOSE"

        cd "$COMPOSE_DIR/$COMPOSE" && docker compose up -d
    done

elif [ "$1" = "restart" ]
then

    for COMPOSE in "${COMPOSES[@]}"
    do
        echo
        echo "Restarting: $COMPOSE"

        cd "$COMPOSE_DIR/$COMPOSE" && docker compose down
        docker compose up -d
    done

else

    echo
    echo "Usage:"
    echo "./compose-manager.sh up"
    echo "./compose-manager.sh down"
    echo "./compose-manager.sh restart"

fi
