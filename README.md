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

* neuen Image installiert für google cAdvisor