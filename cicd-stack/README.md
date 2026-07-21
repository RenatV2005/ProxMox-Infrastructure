# CI/CD Learning Session #1
## Thema
Eigene CI/CD Pipeline mit Gitea Actions + eigenem Docker CI-Image

---

# Ziel

Eine reproduzierbare CI-Umgebung bauen, welche:

- Git verwendet
- Docker Compose validieren kann
- später Ansible prüfen kann
- später YAML linten kann
- auf DEV / TEST / PROD identisch funktioniert

---

# Das Problem

Pipeline schlug fehl mit:

docker: 'compose' is not a docker command.

---

# Erste Vermutung

Docker Compose ist nicht installiert.

FALSCH.

Compose war installiert.

Aber:

Host:
Docker Compose V2

Container:
Docker Compose V1

---

# Wichtige Erkenntnis

docker compose

und

docker-compose

sind NICHT dasselbe.

V1

docker-compose

↓

Eigenständiges Programm

----------------------------

V2

docker compose

↓

Docker CLI Plugin

---

# Debugging Workflow

1.

Prüfen ob Runner das eigene Image nutzt

↓

Ergebnis:

JA

----------------------------

2.

force_pull prüfen

↓

force_pull: false

↓

Lokale Images werden benutzt.

----------------------------

3.

Container starten

docker run --rm -it ci-image:1.0 bash

↓

Versionen prüfen.

----------------------------

4.

Installierte Pakete prüfen

dpkg -l | grep docker

dpkg -l | grep compose

↓

Container hatte:

docker.io 20.x

docker-compose 1.29

----------------------------

5.

Host prüfen

docker info

dpkg -l | grep docker

↓

Host hatte:

docker-cli 26

docker-compose 2.26

docker-buildx

docker.io 26

↓

Host und Container unterschiedlich.

---

# Wichtigste Erkenntnis

Gleicher Paketname

!=

gleiche Version.

Die Debian-Version entscheidet,
welche Pakete verfügbar sind.

Bookworm

↓

Docker 20

Compose V1

----------------------------

Trixie

↓

Docker 26

Compose V2

---

# Professionelle Lösung

Nicht:

apt install docker.io

Sondern:

Docker Official Repository verwenden.

↓

Docker GPG Key

↓

Docker Repository

↓

docker-ce-cli

↓

docker-buildx-plugin

↓

docker-compose-plugin

Dadurch erhält jede Maschine dieselben Docker-Komponenten.

---

# Warum ist das besser?

DEV

↓

TEST

↓

PROD

↓

bauen alle exakt dasselbe Image.

Keine Unterschiede zwischen den Servern.

Keine Überraschungen.

Reproduzierbare Builds.

---

# CI Image

Das Dockerfile definiert vollständig die Build-Umgebung.

Nicht der Host.

Nicht Debian.

Nicht der Runner.

Das Dockerfile ist die Wahrheit.

---

# Pipeline

Push

↓

Runner startet

↓

Checkout

↓

Docker Compose Validation

↓

SUCCESS

↓

Pipeline grün

---

# Wichtiges Learning

CI Images sind Versioniert.

Beispiel:

ci-image:1.0

↓

erste Version

ci-image:2.0

↓

neue Umgebung

↓

Pipeline kann gezielt auf Versionen wechseln.

---

# Debugging-Regel

Nie raten.

Immer beweisen.

Fragen:

1.
Welches Image läuft?

2.
Welche Version läuft?

3.
Welche Pakete sind installiert?

4.
Welche Distribution läuft?

5.
Welche Repositorys werden verwendet?

6.
Wo unterscheiden sich Host und Container?

Erst danach wird geändert.

---

# Befehle

Image bauen

docker build -t ci-image:2.0 ./Dockerfiles/ci-image

----------------------------

Container starten

docker run --rm -it ci-image:2.0 bash

----------------------------

Docker Version

docker --version

----------------------------

Compose Version

docker compose version

----------------------------

Pakete

dpkg -l | grep docker

----------------------------

Binary finden

which docker

----------------------------

Paket finden

dpkg -S $(which docker)

----------------------------

Images anzeigen

docker images

---

# DevOps Denkweise

Nicht:

"Wie installiere ich Docker?"

Sondern:

"Wie baue ich eine reproduzierbare Build-Umgebung, die überall identisch funktioniert?"

Das ist echtes CI/CD Engineering.
