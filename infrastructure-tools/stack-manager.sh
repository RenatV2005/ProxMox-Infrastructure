#!/bin/bash

COMPOSE_DIR="/home/renatubuntu/documentation"

COMPOSES=(
monitoring-stack
documentation-stack
git-platform
web-stack
reverse-proxy
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
    echo "./stack-manager.sh up"
    echo "./stack-manager.sh down"
    echo "./stack-manager.sh restart"

fi
