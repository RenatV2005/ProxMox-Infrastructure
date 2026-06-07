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


## 07.06.2026
# Volumen und deren Bedeutung 

# Volume sind wichtig, da diese Anwendungen Daten speicheren 
# Grafana: Dashboards,  Benutzer, Passwörter, Datasources
# MariaDB: Datenbanken, Tabellen, Benutzerdaten
# Zabbix: Hosts, Triggers, Alarme, Monitoringdaten

# Wenn diese im Container liegen: Container gelöscht = Daten Weg

# Deswegen immer die Regel: Container = Anwendung; Volume = Daten 

# - danach habe ich meinen ersten Volume erstellt mit 

docker volume create nginx-data 

#  Docker Volume für nginx Config erstellt mit 

docker cp nginx-web:/etc/nginx/conf.d/default.conf \
/home/renatubuntu/documentation/nginx-config/default.conf

# nun habe ich einen neuen Nginx Cotainer erstellt mit 2 Volumes 

docker run -d \
--name nginx-web \
-p 8080:80 \
-v /home/renatubuntu/documentation/Webserver:/usr/share/nginx/html \
-v /home/renatubuntu/documentation/nginx-config/default.conf:/etc/nginx/conf.d/default.conf \
--restart unless-stopped \
nginx

# Dadurch kann ich den config und die index.html ohne den Container login verändern 

## Docker Network erstellen

docker network create homelab-net
docker network ls
docker network inspect homelab-net

# Network überprüfen

ip a | grep docker

