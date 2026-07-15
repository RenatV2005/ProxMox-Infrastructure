# Gitea Stack

## Services
- Gitea
- PostgreSQL

## Ports
- 3001 -> Gitea Web UI
- 5432 -> PostgreSQL (internal)

## Volumes
- gitea-daten
- postgres-daten

## Start
docker compose up -d

## Stop
docker compose down
