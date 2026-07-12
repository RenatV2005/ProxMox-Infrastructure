# Linux Homelab

## Hardware

* Proxmox VE
* Ubuntu Server
* Debian Workstation

---

## Ziel

Aufbau eines Linux- und DevOps-Homelabs zur Vorbereitung auf:

* Linux Essentials
* Junior Linux Administrator
* Junior System Administrator
* Junior DevOps Engineer

---

## Projekt 1: Docker Grundlagen

### Docker Installation

Docker Engine auf Ubuntu Server installiert.

### Erstes Image

Image heruntergeladen:

```bash
docker pull nginx
```

### Erstes Container Deployment

```bash
docker run -d -p 80:80 nginx
```

### Docker Grundlagen gelernt

* Images anzeigen
* Container anzeigen
* Container starten
* Container stoppen
* Container löschen
* Logs anzeigen
* In Container einloggen
* Images löschen

Verwendete Befehle:

```bash
docker images
docker ps
docker ps -a
docker start
docker stop
docker logs
docker exec
docker rm
docker rmi
```

---

## Volume Mounts

Ziel:

HTML-Datei außerhalb des Containers speichern und Änderungen dauerhaft behalten.

Ordner auf Ubuntu erstellt:

```text
/home/renatubuntu/documentation/Webserver
```

Datei erstellt:

```text
index.html
```

Container mit Volume gestartet:

```bash
docker run -d \
--name nginx-web \
-p 8080:80 \
-v /home/renatubuntu/documentation/Webserver:/usr/share/nginx/html \
nginx
```

Erkenntnis:

Änderungen an der Datei auf dem Ubuntu Host werden sofort im Container sichtbar.

Dadurch bleiben Daten auch nach dem Löschen des Containers erhalten.

---

## Git & GitHub

Git auf Ubuntu eingerichtet.

Erstes Repository erstellt:

```bash
git init
```

SSH-Key erzeugt und mit GitHub verbunden.

Erster Push erfolgreich durchgeführt.

Repository:

ProxMox-Infrastructure

Ziel:

* Dokumentation aller Homelab-Projekte
* Git lernen
* Versionsverwaltung lernen
* Portfolio für Bewerbungen aufbauen

---

## Nächste Schritte

* Docker Compose
* Portainer
* Git Workflow verbessern
* Bash Skripting
* Monitoring mit Zabbix
* Ansible Grundlagen
* Linux Essentials Vorbereitung

---


# 07.06.2026

## Volumen und deren Bedeutung 

* Volume sind wichtig, da diese Anwendungen Daten speicheren 
* Grafana: Dashboards,  Benutzer, Passwörter, Datasources
* MariaDB: Datenbanken, Tabellen, Benutzerdaten
* Zabbix: Hosts, Triggers, Alarme, Monitoringdaten
 
* Wenn diese im Container liegen: Container gelöscht = Daten Weg

* Deswegen immer die Regel: Container = Anwendung; Volume = Daten 

* danach habe ich meinen ersten Volume erstellt mit 

```bash
docker volume create nginx-data 
```

*  Docker Volume für nginx Config erstellt mit 

```bash
docker cp nginx-web:/etc/nginx/conf.d/default.conf \
/home/renatubuntu/documentation/nginx-config/default.conf
```

* nun habe ich einen neuen Nginx Cotainer erstellt mit 2 Volumes 

```bash
docker run -d \
--name nginx-web \
-p 8080:80 \
-v /home/renatubuntu/documentation/Webserver:/usr/share/nginx/html \
-v /home/renatubuntu/documentation/nginx-config/default.conf:/etc/nginx/conf.d/default.conf \
--restart unless-stopped \
nginx
```

* Dadurch kann ich den config und die index.html ohne den Container login verändern 

* Docker Network erstellen

docker network create homelab-net
docker network ls
docker network inspect homelab-net

* Network überprüfen
```bash
ip a | grep docker
```

# 08.06.26

## Compose erstellen

- compose.yaml erstellt 
- Compose war noch auf dem Server nicht installiert, da bei "docker compose version" kein Ergebniss kam
- mit "docker version" die Version von docker überprüft  29.1.3 - somit war der Client und der Server auf der gleichen Version
- mit "which docker" den Speicher ort überprüft = /usr/bin/docker
- dazu noch die Server Version überprüft mit "cat /etc/os-release" = Ubuntu 26.04 LTS
dpkg -l | grep docker
- dpkg = Debian Package Manager
-l = list
* = ist das Packet überhaupt installiert? 

apt list --installed | grep docker
* = Zeige installierte Packete 

* mit "apt search docker* den Packet suchen, mit "apt search docker | grep compose" das gewünschte Packet suchen
* mit "apt show docker-compose-v2" das Packet untersuchen
* Welche Repository = "apt policy docker-compose-v2"
---

# 10.06.26

## ersten Compose erstellt

```bash
renatubuntu@ubuntumainserver:~/documentation/docker-compose$ docker compose config
name: docker-compose
services:
  nginx-webserver:
    image: nginx
    networks:
      homelab-net: null
    ports:
      - mode: ingress
        target: 80
        published: "8080"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /home/renatubuntu/documentation/Webserver
        target: /usr/share/nginx/html
        bind:
          create_host_path: true
      - type: bind
        source: /home/renatubuntu/documentation/nginx-config/default.conf
        target: /etc/nginx/conf.d/default.conf
        bind:
          create_host_path: true
networks:
  homelab-net:
    name: docker-compose_homelab-net
renatubuntu@ubuntumainserver:~/documentation/docker-compose$
```

# 11.06.26

## Pakete Untersuchen

docker version
cat /etc/os-release
which docker
apt search docker
apt policy docker-compose-v2
dpkg -l | grep docker

apt show docker.io
dpkg -l 
apt list --installed 

* Binary finden
which docker

* Packet deinstallieren 
sudo apt remove nginx 

---

## Reverse Proxy

* zuerst habe ich meinen Compose auf einen weiteren Nginx Container erweitert und habe dort die Configs überprüft mit :
docker exec -it docker-compose-nginx-webserver-1 sh
cat /etc/resolv.conf
cat /etc/hosts

* im Volume wo der Config von nginx-web-1 liegt, habe ich zuerst den Config umgebaut auf :
location /test {
    proxy_pass http://nginx-test;
}
* danach mit dem Bash Befehl, den Config getestet:
docker exec -it docker-compose-nginx-webserver-1 nginx -t

# 13.06.2026

## Grafana Deployment mit Docker Compose

Ziel war es, Grafana als weiteren Service in meine bestehende Docker-Compose-Umgebung zu integrieren.

### Docker Hub Recherche

Zuerst habe ich überprüft, ob ein offizielles Grafana Image existiert:

```bash
docker search grafana
```

Danach wurde das offizielle Image verwendet:

```bash
grafana/grafana
```

---

### Grafana Service erstellen

Compose erweitert:

```yaml
grafana-web:
  image: grafana/grafana
  networks:
    - homelab-net
  ports:
    - 3000:3000
  volumes:
    - /home/renatubuntu/documentation/grafanafiles:/var/lib/grafana
  restart: unless-stopped
```

---

### Berechtigungsproblem analysieren

Nach dem ersten Start konnte Grafana nicht schreiben.

Analyse:

```bash
docker inspect grafana/grafana
```

Ergebnis:

```text
User: 472
```

Dadurch wurde erkannt, dass Grafana nicht als Root läuft.

Anschließend wurden die Besitzrechte angepasst:

```bash
sudo chown -R 472:472 /home/renatubuntu/documentation/grafanafiles
```

Danach startete Grafana erfolgreich.

---

### Reverse Proxy Verständnis

Im Nginx Reverse Proxy wurde eine zusätzliche Location erstellt:

```nginx
location /grafana {
    proxy_pass http://grafana-web:3000/;
}
```

Dabei wurde verstanden:

* grafana-web = Docker DNS Name
* 3000 = Grafana Port
* /grafana = URL Pfad des Reverse Proxys

---

### Erkenntnisse

Gelernt:

* Docker DNS zwischen Containern
* Reverse Proxy Grundlagen
* Bind Mounts
* UID/GID Berechtigungen
* Docker Inspect
* Docker Compose Erweiterung
* Persistent Storage für Container

# 14.06.26

# Homelab Progress Report – Docker, Prometheus, Grafana & Reverse Proxy

## Ziel

Aufbau einer Linux-basierten Monitoring- und Webserver-Umgebung mit Docker Compose, Prometheus, Grafana und Nginx.

---

## Docker Monitoring Stack

### Komponenten

* Prometheus
* Grafana
* Node Exporter

### Architektur

Ubuntu Server
↓
Docker
↓
Prometheus
↓
Node Exporter
↓
Grafana

### Erkenntnisse

#### Node Exporter

Node Exporter sammelt Linux-Systemmetriken.

Beispiele:

* CPU Nutzung
* RAM Nutzung
* Dateisysteme
* Load Average
* Netzwerkstatistiken

Prometheus speichert diese Daten als Time Series.

Grafana visualisiert die Daten.

---

## Prometheus Konfiguration

Datei:

```yaml
prometheus.yml
```

Konfiguration eines Scrape Targets:

```yaml
scrape_configs:
  - job_name: "prometheus"

    static_configs:
      - targets:
        - node-exporter:9100
```

Wichtige Erkenntnis:

Container im selben Docker Network können sich direkt über ihren Containernamen erreichen.

Kein IP-Management notwendig.

---

## Grafana

### Einrichtung

Login:

admin
admin

Beim ersten Login Passwort ändern.

### Data Source

Prometheus wurde als Data Source eingebunden.

URL:

http://prometheus:9090

### Dashboard

Importiertes Node Exporter Dashboard.

Sichtbare Kennzahlen:

* CPU Busy
* Memory Used
* Filesystem Usage
* Load Average
* Network Traffic

---

## Docker Compose Grundlagen

Gelernt:

* image
* container
* ports
* volumes
* networks
* restart policies

Beispiel:

```yaml
volumes:
  - ./nginx-files:/usr/share/nginx/html
```

Bind Mount verbindet Host-Dateien mit dem Container.

---

## Reverse Proxy Projekt

### Ziel

Nur ein öffentlich erreichbarer Container.

Architektur:

Internet
↓
Nginx Proxy
↓
Nginx App

### Docker DNS Test

Befehl:

```bash
docker exec -it projeckt-webserver-nginx-proxy-1 getent hosts nginx-app
```

Ergebnis:

```bash
172.19.0.3 nginx-app
```

Docker DNS funktioniert.

### HTTP Test

Befehl:

```bash
curl http://nginx-app
```

Ergebnis:

Die Webseite wurde erfolgreich ausgeliefert.

Der Reverse Proxy kann den Backend-Webserver erreichen.

---

## Wichtige Linux Befehle

```bash
docker ps
docker logs
docker inspect
docker exec -it
curl
getent hosts
```

---

## Nächste Schritte

* Reverse Proxy vollständig fertigstellen
* Grafana hinter Nginx veröffentlichen
* Prometheus hinter Nginx veröffentlichen
* HTTPS mit Let's Encrypt
* UFW Firewall
* SSH Hardening
* Git Repository
* CI/CD Grundlagen
* Docker Monitoring erweitern
* Linux Sysadmin Skills vertiefen

# 15.06.26

## Troubleshooting: Website lieferte 404 nach Compose-Migration

### Ursache
Der Reverse-Proxy verwendete weiterhin eine proxy_pass Konfiguration, obwohl die Umgebung auf einen einzelnen Nginx-Webserver zurückgebaut wurde.

### Analyse
- Ports mit ss -tulpn geprüft
- Docker Compose Konfiguration geprüft
- Bind Mounts überprüft
- Nginx Konfiguration verglichen

### Lösung
Passende Nginx-Konfiguration wieder eingebunden.

### Erkenntnis
404-Fehler entstehen oft auf Anwendungsebene und nicht durch Netzwerk- oder Docker-Probleme.

# 17.06.26

## Infrastruktur erweitern

* Ubuntu Server auf Proxmox auf 6Gb>8Gb & Harddisk 32Gb > 102Gb erweitert

## Monitoring 

cat /proc/stat
cat /proc/meminfo

# Homelab Update - cAdvisor Integration

## Ziel

Heute habe ich cAdvisor in meinen Monitoring-Stack integriert, um zusätzlich zu Node Exporter auch Docker Container überwachen zu können.

## Bereits vorhandener Stack

- Prometheus
- Grafana
- Node Exporter
- Nginx

## Vorgehen

Zunächst lief cAdvisor nicht korrekt und meldete Fehler bezüglich CPU Mountpoints.

Nach Analyse der Logs und der offiziellen GitHub-Dokumentation wurde festgestellt, dass die empfohlene Container-Konfiguration zusätzliche Volumes und Berechtigungen benötigt.

Anstatt lange zu experimentieren, wurde die offizielle cAdvisor-Konfiguration aus der Dokumentation übernommen und an Docker Compose angepasst.

## Prometheus Integration

Anschließend wurde Prometheus erweitert:

```yaml
- job_name: "cadvisor"

  static_configs:
    - targets: ["cadvisor:8080"]
```

Danach konnte überprüft werden, dass Prometheus sowohl Node Exporter als auch cAdvisor erfolgreich scraped.

## Verifikation

Kontrolliert mit:

```bash
docker ps
docker logs
curl http://localhost:9090/api/v1/targets
```

Ergebnis:

- node-exporter = UP
- cadvisor = UP
- Prometheus = UP
- Grafana = UP

## Erkenntnisse

- Offizielle Dokumentationen zuerst lesen spart viel Zeit.
- Docker DNS macht die Kommunikation zwischen Containern sehr einfach.
- Ein einzelner Prometheus Server kann problemlos mehrere Exporter gleichzeitig überwachen.
- cAdvisor ergänzt Node Exporter perfekt, da nun auch Container-spezifische Metriken verfügbar sind.

## Nächste Schritte

- Grafana Dashboard für cAdvisor erstellen
- Container CPU-Auslastung visualisieren
- Container RAM-Verbrauch visualisieren
- Alerts für hohe Ressourcenauslastung vorbereiten

# BookStack + MariaDB Homelab Stack 03.07.26

## Overview

This project deploys a self-hosted documentation platform using:

- BookStack
- MariaDB
- Docker Compose
- Bind Mount Volumes
- Environment Variables (.env)

The stack is designed as an enterprise-style learning project to improve:

- Docker Compose
- Persistent Storage
- Environment Variable Management
- Container Networking
- Service Discovery via Docker DNS
- Troubleshooting and Log Analysis

---

## Architecture

Browser
↓
BookStack Container
↓
Docker Network
↓
MariaDB Container
↓
Persistent Bind Mount Storage

---

## Technologies

- Docker
- Docker Compose
- MariaDB
- BookStack
- Linux
- Bind Mounts
- Docker Networks
- Environment Variables

---

## Volumes

### BookStack Application Data

```text
./bookstack-app -> /config

# Homelab Fortschritt - Docker / Git / Selfhosting Session

## Infrastruktur Status

Aktuell laufen dauerhaft auf meinem Ubuntu Server:

- Nginx Webserver
- Prometheus
- Grafana
- cAdvisor
- Node Exporter
- BookStack + MariaDB
- Gitea + PostgreSQL

Aktuelle Container:

- Monitoring Stack
- Documentation Stack
- Selfhosted Git Platform

---

# Docker / Compose Fortschritt

## Monitoring Stack

Bestehend aus:

- Prometheus
- Grafana
- Node Exporter
- cAdvisor

Lerninhalte:

- Docker Compose
- Container Netzwerke
- Volumes
- Bind Mounts
- Container Kommunikation
- Port Publishing
- Docker DNS

---

## BookStack Stack

Bestehend aus:

- BookStack
- MariaDB

Lerninhalte:

- MariaDB Grundlagen
- Datenbank User
- Datenbank Tabellen
- Datenpersistenz
- Bind Mount Storage
- APP_KEY Prinzip
- Laravel Anwendungen
- Container Debugging
- Logs analysieren
- docker exec
- printenv
- Datenbank Verbindungen testen

Wichtigste Erkenntnis:

Container besitzen teilweise eigene Konfigurationsdateien innerhalb der Volumes, welche wichtiger sein können als Docker Environment Variablen.

Beispiel:

```text
bookstack-app/www/.env

# 05.07.2026 - Docker Reverse Proxy (Nginx) erfolgreich implementiert

## Ziel

Ein zentraler Reverse Proxy sollte alle internen Dienste unter eigenen DNS-Namen erreichbar machen:

- bookstack.renatubuntu
- gitea.renatubuntu
- grafana.renatubuntu
- cadvisor.renatubuntu

Anstatt:

- 192.168.0.180:6875
- 192.168.0.180:3001
- 192.168.0.180:3000
- 192.168.0.180:8080

---

## Neues Compose Projekt erstellt

Neues Docker Compose Projekt:

```text
docker-compose4
├── compose.yaml
└── nginx-config
    ├── bookstack.conf
    ├── gitea.conf
    ├── grafana.conf
    └── cadvisor.conf

    # Docker Networks verstehen

## Die wichtigste Regel zuerst

Der Netzwerkname innerhalb einer `compose.yaml` ist **nicht automatisch** der echte Docker Netzwerkname.

Beispiel:

### Compose 1

```yaml
networks:
  homelab-net:
```

### Compose 2

```yaml
networks:
  homelab-net:
```

### Compose 3

```yaml
networks:
  homelab-net:
```

Viele denken jetzt:

> Alle Container liegen im gleichen Netzwerk.

Das stimmt **nicht**.

---

# Was Docker Compose tatsächlich macht

Docker Compose erstellt automatisch eigene Netzwerke pro Projekt.

Beispiel:

```bash
docker compose config
```

liefert:

```yaml
name: docker-compose
```

Dadurch erstellt Docker:

```text
docker-compose_homelab-net
```

Bookstack:

```yaml
name: docker-compose2
```

erstellt:

```text
docker-compose2_homelab-net
```

Gitea:

```yaml
name: docker-compose3
```

erstellt:

```text
docker-compose3_gitea
```

---

# Beispiel aus meinem Homelab

## Monitoring Stack

```text
docker-compose_homelab-net
│
├── grafana
├── prometheus
├── cadvisor
└── node-exporter
```

## Bookstack Stack

```text
docker-compose2_homelab-net
│
├── bookstack-app
└── mariadb
```

Obwohl beide Netzwerke:

```yaml
homelab-net
```

heißen, handelt es sich um **zwei vollständig getrennte Docker Netzwerke**.

Die Container können sich gegenseitig nicht sehen.

---

# Die Ausnahme: external: true

Hier kommt die eigentliche Magie ins Spiel.

```yaml
networks:
  reverse-proxy-net:
    external: true
```

Das bedeutet:

> Docker Compose soll dieses Netzwerk nicht selbst erstellen.

Stattdessen:

> Verwende ein bereits existierendes Docker Netzwerk.

---

## Netzwerk erstellen

```bash
docker network create reverse-proxy-net
```

Danach existiert systemweit:

```text
reverse-proxy-net
```

---

## Verwendung in mehreren Compose Projekten

Compose 2:

```yaml
networks:
  reverse-proxy-net:
    external: true
```

Compose 3:

```yaml
networks:
  reverse-proxy-net:
    external: true
```

Compose 4:

```yaml
networks:
  reverse-proxy-net:
    external: true
```

Jetzt befinden sich alle Container im gleichen Netzwerk:

```text
reverse-proxy-net
│
├── reverse-proxy
├── bookstack-app
├── gitea
├── grafana-web
└── cadvisor
```

Dadurch funktioniert:

```nginx
proxy_pass http://bookstack-app:80;
```

oder:

```nginx
proxy_pass http://gitea:3000;
```

Docker DNS löst automatisch die Namen in interne Container-IP-Adressen auf.

---

# Docker DNS

Innerhalb eines Docker Netzwerks kommunizieren Container normalerweise nicht über:

```text
192.168.x.x
```

sondern über ihre Servicenamen:

```text
bookstack-app
gitea
grafana-web
cadvisor
mariadb
postgres
```

Beispiel:

```nginx
proxy_pass http://bookstack-app:80;
```

Docker übersetzt intern automatisch:

```text
bookstack-app
↓
172.21.0.2
```

---

# Mehrere Netzwerke pro Container

Ein Container kann Mitglied mehrerer Netzwerke gleichzeitig sein.

Beispiel:

```text
bookstack-app
│
├── docker-compose2_homelab-net
└── reverse-proxy-net
```

Dadurch kann Bookstack:

- mit MariaDB kommunizieren
- gleichzeitig vom Reverse Proxy erreicht werden

MariaDB dagegen liegt nur hier:

```text
docker-compose2_homelab-net
```

Dadurch bleibt die Datenbank vom Reverse Proxy isoliert.

Das entspricht bereits einer sauberen Infrastruktur-Architektur.

---

# Vergleich mit Enterprise Netzwerken

Das Konzept ähnelt stark klassischen Unternehmensnetzwerken:

```text
DMZ
Management VLAN
Backend VLAN
Frontend VLAN
Storage VLAN
```

Ein System darf nur mit den Netzwerken kommunizieren, die es wirklich benötigt.

---

# Nützliche Befehle

## Alle Docker Netzwerke anzeigen

```bash
docker network ls
```

---

## Inhalt eines Netzwerkes anzeigen

```bash
docker network inspect reverse-proxy-net
```

---

## Netzwerke eines Containers anzeigen

```bash
docker inspect CONTAINERNAME
```

---

## Netzwerkmodus eines Containers anzeigen

```bash
docker inspect CONTAINERNAME | grep NetworkMode
```

---

# Merksatz

```text
Gleicher Netzwerkname in verschiedenen compose Dateien
≠
gleiches Docker Netzwerk

external: true
=
gemeinsames Docker Netzwerk
```

---

# Mein persönliches Learning

Vor dem Reverse Proxy dachte ich:

```text
Wenn mehrere compose Dateien denselben Netzwerknamen benutzen,
dann befinden sich die Container automatisch im selben Netzwerk.
```

Nach dem Reverse Proxy Projekt wurde klar:

```text
Docker Compose erstellt standardmäßig eigene Netzwerke pro Projekt.

Nur external: true verbindet mehrere Compose Projekte
über ein gemeinsames Docker Netzwerk.
```

Das war einer der wichtigsten Docker Networking Momente meines Homelabs.

# 06.07.2026 - Docker Port Mapping, Docker NAT und Container Networking

## Ziel

Verstehen, warum mehrere Container denselben internen Port verwenden können und warum dennoch unterschiedliche Host-Ports benötigt werden.

---

## Docker Port Syntax

```yaml
ports:
  - "HOST_PORT:CONTAINER_PORT"


---

## Backups erstellen mit tar

Verstehen wie physische Backups funktionieren.

---

## Durchgeführt

### Backup erstellt

```bash
sudo tar -czf backup/bookstack-app-backup.tar.gz bookstack-app

# MariaDB Logical Backup mit Docker (Enterprise)

## Ziel

Ein logisches Backup der MariaDB-Datenbank erstellen, ohne das Passwort im Skript zu speichern.

---

# Backup-Befehl

```bash
docker exec docker-compose2-mariadb-datenbank-1 \
sh -c 'mariadb-dump -u root -p"$MARIADB_ROOT_PASSWORD" bootstackdb' \
> backup/bookstack-db-backup.sql
```

---

# Erklärung

## 1. docker exec

```bash
docker exec
```

Führt einen Befehl innerhalb eines bereits laufenden Docker-Containers aus.

---

## 2. Containername

```bash
docker-compose2-mariadb-datenbank-1
```

Docker weiß dadurch:

> Der folgende Befehl soll **nicht auf dem Ubuntu Host**, sondern **im MariaDB-Container** ausgeführt werden.

---

## 3. sh -c

```bash
sh -c
```

Startet eine Shell innerhalb des Containers.

Das `-c` bedeutet:

> "Führe den folgenden String als Shell-Befehl aus."

Beispiel:

```bash
sh -c "ls"
```

führt intern einfach

```bash
ls
```

aus.

---

## 4. mariadb-dump

```bash
mariadb-dump
```

Erstellt ein **logisches Backup** der Datenbank.

Dabei werden keine Datenbankdateien kopiert.

Stattdessen erzeugt MariaDB eine SQL-Datei mit Befehlen wie:

```sql
CREATE TABLE ...

INSERT INTO ...
```

---

## 5. Benutzer

```bash
-u root
```

Verbindet sich als Benutzer:

```
root
```

---

## 6. Passwort

```bash
-p"$MARIADB_ROOT_PASSWORD"
```

Hier wird **keine Zeichenkette** gespeichert.

Die Shell ersetzt

```bash
$MARIADB_ROOT_PASSWORD
```

automatisch durch den Wert der Umgebungsvariable.

Beispiel:

```
MARIADB_ROOT_PASSWORD=koridor1
```

Intern wird daraus:

```bash
-pkoridor1
```

Dadurch muss das Passwort **nicht hart im Skript stehen**.

---

## 7. Datenbank

```bash
bootstackdb
```

Die Datenbank, die gesichert werden soll.

---

## 8. >

```bash
>
```

Dies ist **kein Docker-Befehl**.

Der Linux-Host leitet die Ausgabe von `mariadb-dump` in eine Datei um.

Ergebnis:

```
backup/
└── bookstack-db-backup.sql
```

---

# Gesamter Ablauf

Ubuntu Host

↓

docker exec

↓

MariaDB Container

↓

sh -c

↓

mariadb-dump

↓

SQL-Ausgabe (STDOUT)

↓

Linux Redirect (>)

↓

backup/bookstack-db-backup.sql

---

# Warum sh -c?

Innerhalb der Shell kennt der Container bereits seine Umgebungsvariablen.

Beispielsweise:

```bash
MARIADB_ROOT_PASSWORD
```

Dadurch muss das Passwort nicht im Skript hinterlegt werden.

Dieses Muster wird häufig in Enterprise-Umgebungen verwendet.

---

# Merksatz

Nicht:

```
Host
↓
MariaDB
```

Sondern:

```
Host

↓

docker exec

↓

Container

↓

Shell

↓

Programm

↓

Ausgabe

↓

Datei auf dem Host
```

---

# Bash-Pattern

Dieses Muster wird in Docker sehr häufig verwendet:

```bash
docker exec <container> \
sh -c '<programm> "$VARIABLE"'
```

Beispiele:

```bash
docker exec postgres \
sh -c 'pg_dump ...'
```

```bash
docker exec nginx \
sh -c 'nginx -t'
```

```bash
docker exec redis \
sh -c 'redis-cli save'
```

Es gehört zu den wichtigsten Mustern beim Arbeiten mit Docker und Containern.