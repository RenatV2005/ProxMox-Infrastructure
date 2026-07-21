# Linux Debugging Guide
# Pakete, Versionen & Repositorys verstehen

---

# Warum ist dieser Guide wichtig?

Ein Programm kann auf zwei Systemen unterschiedlich funktionieren, obwohl
es den gleichen Namen besitzt.

Der Grund sind meistens:

- andere Distribution
- andere Paketquelle (Repository)
- andere Paketversion

Bevor etwas installiert wird, sollte immer geprüft werden:

- Welche Version läuft?
- Woher stammt das Paket?
- Welche Distribution benutze ich?

---

# Die wichtigsten Begriffe

## Distribution

Beispiele

Debian 12 (Bookworm)

Debian 13 (Trixie)

Ubuntu 24.04

Fedora

Jede Distribution liefert andere Paketversionen.

---

## Repository

Ein Repository ist eine Paketquelle.

Beispiele

Debian Repository

Docker Repository

Microsoft Repository

Hashicorp Repository

Eine Distribution kann mehrere Repositorys gleichzeitig verwenden.

---

## Paket

Ein Paket enthält Programme.

Beispiele

docker.io

docker-cli

docker-compose

nginx

git

ansible

---

# Warum unterscheiden sich Versionen?

Beispiel

Host

Docker Compose 2.26

Container

Docker Compose 1.29

Obwohl beide

docker-compose

heißen.

Warum?

↓

Andere Debian-Version.

Oder

↓

Anderes Repository.

---

# Wichtigste Regel

Gleicher Paketname

!=

gleiche Version

---

# Betriebssystem anzeigen

cat /etc/os-release

oder

hostnamectl

Beispiel

Debian GNU/Linux 13 (Trixie)

---

# Installierte Pakete anzeigen

dpkg -l

Alle Docker Pakete

dpkg -l | grep docker

Alle Compose Pakete

dpkg -l | grep compose

---

# Version eines Programms

docker --version

docker compose version

git --version

ansible --version

python3 --version

---

# Wo befindet sich das Programm?

which docker

Beispiel

/usr/bin/docker

---

# Welches Paket besitzt diese Datei?

dpkg -S $(which docker)

Beispiel

docker-cli:
/usr/bin/docker

Jetzt weiß man:

Nicht irgendein Paket,

sondern

docker-cli

liefert dieses Binary.

---

# Paketinformationen

apt show docker.io

oder

apt-cache policy docker.io

Dadurch sieht man:

- Version
- Repository
- Priorität

---

# Welche Versionen existieren?

apt-cache madison docker.io

oder

apt-cache policy docker.io

---

# Paket suchen

apt search docker

---

# Welche Repositorys werden verwendet?

ls /etc/apt/sources.list.d/

cat /etc/apt/sources.list

Beispiele

docker.list

microsoft.list

hashicorp.list

debian.sources

---

# Paketquellen aktualisieren

sudo apt update

Dadurch werden

NICHT

die Pakete aktualisiert.

Es werden nur die Paketlisten neu geladen.

---

# Pakete aktualisieren

sudo apt upgrade

---

# Architektur anzeigen

dpkg --print-architecture

Beispiel

amd64

arm64

---

# Typischer Debugging Ablauf

Problem

↓

Version prüfen

docker --version

↓

Programm finden

which docker

↓

Paket finden

dpkg -S $(which docker)

↓

Installierte Pakete prüfen

dpkg -l | grep docker

↓

Distribution prüfen

cat /etc/os-release

↓

Repository prüfen

apt-cache policy docker.io

↓

Repositorys prüfen

ls /etc/apt/sources.list.d/

↓

Erst jetzt Änderungen vornehmen.

---

# Unser Beispiel

Host

Debian 13

↓

docker-cli 26

↓

docker-compose 2.26

↓

docker buildx

----------------------------------

Container

Debian 12

↓

docker.io 20

↓

docker-compose 1.29

----------------------------------

Problem

docker compose

existiert nicht.

Nicht weil Docker kaputt war.

Sondern weil unterschiedliche Pakete
aus unterschiedlichen Repositorys installiert wurden.

---

# Lösung

Nicht das Debian Repository verwenden.

Sondern

Docker Official Repository.

↓

docker-ce-cli

↓

docker-buildx-plugin

↓

docker-compose-plugin

Dadurch erhält jede Maschine dieselben Versionen.

---

# DevOps Regel

Nicht fragen:

"Wie installiere ich Paket X?"

Sondern fragen:

- Welche Version brauche ich?
- Woher kommt sie?
- Ist sie reproduzierbar?
- Wird DEV, TEST und PROD identisch sein?

Das ist reproduzierbare Infrastruktur.
