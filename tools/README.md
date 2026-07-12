#!/bin/bash

COMPOSE_DIR="/home/renatubuntu/documentation"

COMPOSES=(
docker-compose
docker-compose2
docker-compose3
docker-compose4
docker-compose5
)

for COMPOSE in "${COMPOSES[@]}"
do
    cd "$COMPOSE_DIR/$COMPOSE"
    docker compose down
done

- erster Skript, der alle Composes ausschaltet, somit habe ich verstanden, wie ich die Variablen und for in sinnvoll nutze 

# Enterprise DevOps Troubleshooting Guide

> Ziel:
>
> Nicht raten.
> Nicht sofort googeln.
> Sondern Probleme systematisch eingrenzen.

---

# Allgemeines Prinzip

Jedes Problem wird in derselben Reihenfolge analysiert.

```
User
        │
        ▼
DNS
        │
        ▼
Firewall
        │
        ▼
Reverse Proxy
        │
        ▼
Docker
        │
        ▼
Application
        │
        ▼
Database
```

Je tiefer man geht,
desto genauer wird die Fehlersuche.

---

# 1. Erreichbarkeit prüfen

## Ping

```bash
ping 192.168.0.180
```

Prüft:

- Host erreichbar
- Netzwerk funktioniert

---

## DNS

```bash
nslookup gitea.renatubuntu
```

oder

```bash
dig gitea.renatubuntu
```

Prüft:

- DNS-Auflösung
- richtige IP

---

## HTTP

```bash
curl http://gitea.renatubuntu
```

oder

```bash
curl -I http://gitea.renatubuntu
```

Prüft:

- HTTP Antwort
- Statuscode

---

# 2. Reverse Proxy

Prüfen:

```bash
docker logs reverse-proxy
```

oder

```bash
journalctl -u nginx
```

Fragen:

- Route vorhanden?
- DNS richtig?
- SSL Fehler?
- 502?
- 404?

---

# 3. Docker

Container anzeigen

```bash
docker ps
```

Alle Container

```bash
docker ps -a
```

Logs

```bash
docker logs CONTAINERNAME
```

Live Logs

```bash
docker logs -f CONTAINERNAME
```

Container Informationen

```bash
docker inspect CONTAINERNAME
```

Container Ressourcen

```bash
docker stats
```

---

# 4. Docker Compose

Status

```bash
docker compose ps
```

Starten

```bash
docker compose up -d
```

Stoppen

```bash
docker compose down
```

Logs

```bash
docker compose logs
```

Live

```bash
docker compose logs -f
```

---

# 5. Linux Services

Status

```bash
systemctl status nginx
```

Logs

```bash
journalctl -u nginx
```

Live Logs

```bash
journalctl -fu nginx
```

Aktive Services

```bash
systemctl list-units --type=service
```

---

# 6. Prozesse

Alle Prozesse

```bash
ps aux
```

Live

```bash
top
```

oder

```bash
htop
```

Prozess suchen

```bash
ps aux | grep nginx
```

Prozess beenden

```bash
kill PID
```

---

# 7. Netzwerk

Offene Ports

```bash
ss -tulpen
```

Routing

```bash
ip route
```

Interfaces

```bash
ip a
```

Verbindungen

```bash
ss -tunap
```

---

# 8. Speicher

Freier Speicher

```bash
df -h
```

RAM

```bash
free -h
```

Ordnergröße

```bash
du -sh *
```

---

# 9. Berechtigungen

Besitzer

```bash
ls -l
```

UID / GID

```bash
id
```

Datei

```bash
stat DATEI
```

---

# 10. Datenbanken

MariaDB

Container

```bash
docker exec -it docker-compose2-mariadb-datenbank-1 bash
```

Prüfen

```bash
mariadb
```

---

PostgreSQL

Container

```bash
docker exec -it docker-compose3-postgres-1 bash
```

Client

```bash
psql -U gitea
```

Datenbanken

```sql
\l
```

Tabellen

```sql
\dt
```

Benutzer

```sql
\du
```

---

# Enterprise Reihenfolge

BookStack nicht erreichbar

↓

```bash
ping
```

↓

```bash
curl
```

↓

```bash
docker ps
```

↓

```bash
docker logs
```

↓

```bash
docker inspect
```

↓

```bash
journalctl
```

↓

```bash
ss -tulpen
```

↓

```bash
healthcheck.sh
```

↓

Problem gefunden.

---

# Übungen

## Übung 1

BookStack liefert HTTP 502.

Frage:

- Reverse Proxy?
- Docker?
- Datenbank?
- Logs?

Welche Befehle benutzt du?

---

## Übung 2

Gitea startet nicht.

Welche Reihenfolge benutzt du?

---

## Übung 3

Container läuft.

Webseite funktioniert nicht.

Wo suchst du?

---

## Übung 4

MariaDB startet nicht.

Welche Logs liest du?

---

## Übung 5

Docker Compose startet nicht.

Wie analysierst du das?

---

# Goldene Regel

> Niemals raten.

Immer:

1. Beobachten
2. Hypothese bilden
3. Prüfen
4. Ursache finden
5. Erst dann beheben
