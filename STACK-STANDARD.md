# Homelab Stack Standard

## Required Files

- compose.yaml
- .env
- .env.example
- README.md

## Optional Directories

- data/
- config/
- backup/

## Rules

- Use relative paths (./...)
- Never commit .env
- Every stack must have a README
- Every stack must be runnable with:
  docker compose up -d
- No absolute paths
