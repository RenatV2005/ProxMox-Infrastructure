# Dockerfiles Grundlagen

## Was ist ein Dockerfile?

Ein Dockerfile ist der Bauplan eines Docker Images.

Docker liest das Dockerfile Zeile für Zeile und erstellt daraus ein neues Image.

```
Dockerfile
        │
        ▼
docker build
        │
        ▼
Docker Image
        │
        ▼
Container
```

---

# Unterschied zwischen Image und Dockerfile

Image

- Fertiges Produkt
- Wird gestartet
- Kann aus Docker Hub stammen
- Kann selbst erstellt werden

Dockerfile

- Bauplan
- Erstellt Images
- Kann versioniert werden
- Liegt im Git Repository

---

# Projektstruktur

```
dockerfiles/

└── nginx/

    Dockerfile
    nginx.conf
    index.html
    style.css
    script.js
```

---

# Erstes Dockerfile

```Dockerfile
FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY index.html /usr/share/nginx/html/index.html

COPY style.css /usr/share/nginx/html/style.css

COPY script.js /usr/share/nginx/html/script.js
```

---

# Erklärung

## FROM

```Dockerfile
FROM nginx:latest
```

Verwendet das offizielle Nginx Image als Grundlage.

---

## COPY

```Dockerfile
COPY index.html /usr/share/nginx/html/index.html
```

Kopiert eine Datei aus dem Projekt in das Docker Image.

Die Datei befindet sich anschließend dauerhaft im Image.

---

# Docker Image bauen

Im Dockerfile-Ordner:

```bash
docker build -t renat-nginx:v1 .
```

Bedeutung:

- docker build → Image erstellen
- -t → Name vergeben
- renat-nginx → Image Name
- v1 → Version
- . → aktueller Ordner als Build Context

---

# Images anzeigen

```bash
docker images
```

---

# Compose verwenden

Vorher

```yaml
image: nginx
```

Nachher

```yaml
image: renat-nginx:v1
```

Jetzt wird nicht mehr das Image von Docker Hub verwendet,
sondern das selbst gebaute Image.

---

# Wichtige Erkenntnisse

Dockerfile

↓

Docker Image

↓

Docker Compose

↓

Container

Compose startet Container.

Dockerfiles bauen Images.

---

# Vorteile

- Eigene Konfiguration im Image
- Eigene Webseite im Image
- Weniger Volumes
- Versionierbar mit Git
- Grundlage für CI/CD
