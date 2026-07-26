# .env Guide (Docker Compose)

# Ziel

Eine `.env`-Datei dient dazu, Konfigurationswerte und Geheimnisse (Secrets) von der `compose.yaml` zu trennen.

Beispiele:

- Passwörter
- API Keys
- Datenbanknamen
- Hostnamen
- URLs
- Tokens

Dadurch muss die `compose.yaml` nicht geändert werden.

---

# Aufbau

Beispiel:

```env
MYSQL_ROOT_PASSWORD=meinpasswort
MYSQL_DATABASE=app
MYSQL_USER=app
MYSQL_PASSWORD=passwort

APP_URL=http://192.168.0.182
APP_KEY=base64:xxxxxxxxxxxxxxxxxxxxxxxx

DB_HOST=mysql
DB_DATABASE=app
DB_USER=app
DB_PASS=passwort
```

Keine Leerzeichen verwenden.

Richtig:

```env
DB_USER=bookstack
```

Falsch:

```env
DB_USER = bookstack
```

---

# compose.yaml

Die Variablen werden mit `${...}` eingebunden.

Beispiel:

```yaml
environment:
  - DB_HOST=${DB_HOST}
  - DB_DATABASE=${DB_DATABASE}
  - DB_USER=${DB_USER}
  - DB_PASS=${DB_PASS}
```

---

# Prüfen ob Docker die .env geladen hat

```bash
docker compose config
```

Hier müssen alle Variablen ersetzt worden sein.

Beispiel:

```yaml
environment:
  DB_HOST: mariadb
  DB_DATABASE: bookstack
  DB_USER: bookstack
  DB_PASS: koridor1
```

Wenn stattdessen Warnungen erscheinen:

```text
The "DB_USER" variable is not set.
```

Dann wurde die `.env` nicht geladen oder der Variablenname stimmt nicht.

---

# Debugging

## 1. .env anzeigen

```bash
cat .env
```

Kontrollieren:

- Schreibfehler
- fehlende Variablen
- falsche Passwörter

---

## 2. compose prüfen

```bash
docker compose config
```

Kontrollieren:

- Werden alle Werte übernommen?
- Gibt es Warnungen?

---

## 3. Container starten

```bash
docker compose up -d
```

---

## 4. Logs prüfen

```bash
docker logs <container>
```

Typische Fehler:

```
Access denied
```

→ Benutzer oder Passwort falsch

```
APP_KEY missing
```

→ APP_KEY fehlt

```
Connection refused
```

→ Datenbank läuft nicht

---

# APP_KEY erzeugen

Viele Anwendungen benötigen einen geheimen Schlüssel.

Beispiel BookStack:

```bash
docker run -it --rm \
--entrypoint /bin/bash \
lscr.io/linuxserver/bookstack:latest appkey
```

Ausgabe:

```text
base64:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Diesen Wert in die `.env` eintragen:

```env
APP_KEY=base64:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

---

# Persistente Daten

Viele Container speichern ihre Konfiguration dauerhaft.

Beispiel:

```
bookstack-app/www/.env
```

Änderungen an der Docker-`.env` werden danach häufig nicht automatisch übernommen.

Deshalb prüfen:

```bash
find . -name ".env"
```

Danach:

```bash
cat ./bookstack-app/www/.env
```

Kontrollieren:

- APP_URL
- APP_KEY
- DB_HOST
- DB_DATABASE
- DB_USERNAME
- DB_PASSWORD

---

# HTTP testen

Webserver prüfen:

```bash
curl localhost:PORT
```

oder

```bash
curl http://SERVER-IP:PORT
```

Redirects prüfen:

```bash
curl -I http://SERVER-IP:PORT
```

Interessant:

```
Location:
```

Dort sieht man, wohin die Anwendung weiterleitet.

---

# Netzwerk prüfen

Offene Ports:

```bash
ss -tulpen
```

Container:

```bash
docker ps
```

---

# Reihenfolge beim Debuggen

1. cat .env

↓

2. docker compose config

↓

3. docker compose up -d

↓

4. docker ps

↓

5. docker logs

↓

6. curl localhost:PORT

↓

7. curl SERVER-IP:PORT

↓

8. ss -tulpen

↓

9. Persistente .env prüfen

---

# Best Practices

✅ Keine Passwörter direkt in die compose.yaml schreiben

✅ Alle Konfiguration in `.env`

✅ `.env` niemals in ein öffentliches Git-Repository committen

✅ Immer zuerst `docker compose config` prüfen

✅ Logs lesen bevor Änderungen vorgenommen werden

✅ Bei Anwendungen mit persistenten Volumes zusätzlich die interne `.env` kontrollieren

---

# Gelernt

- Verwendung von `.env`
- Docker Compose Variablen
- APP_KEY
- Secrets
- Docker Logs
- compose config
- HTTP Debugging
- Persistente Konfiguration
- Container Debugging
