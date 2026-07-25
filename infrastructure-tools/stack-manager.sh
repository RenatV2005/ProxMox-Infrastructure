#!/bin/bash

#################################
# Paths
#################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

#################################
# Docker Compose Projects
#################################

COMPOSES=(
    monitoring-stack
    documentation-stack
    git-platform
    web-stack
    reverse-proxy
)

echo "======================================"
echo " Stack Manager"
echo "======================================"

case "$1" in

up)

    for COMPOSE in "${COMPOSES[@]}"
    do
        echo
        echo "Starting: $COMPOSE"

        cd "$PROJECT_ROOT/$COMPOSE" || exit 1
        docker compose up -d
    done
;;

down)

    for COMPOSE in "${COMPOSES[@]}"
    do
        echo
        echo "Stopping: $COMPOSE"

        cd "$PROJECT_ROOT/$COMPOSE" || exit 1
        docker compose down
    done
;;

restart)

    for COMPOSE in "${COMPOSES[@]}"
    do
        echo
        echo "Restarting: $COMPOSE"

        cd "$PROJECT_ROOT/$COMPOSE" || exit 1
        docker compose down
        docker compose up -d
    done
;;

*)

    echo
    echo "Usage:"
    echo "  ./stack-manager.sh up"
    echo "  ./stack-manager.sh down"
    echo "  ./stack-manager.sh restart"
    exit 1
;;

esac
