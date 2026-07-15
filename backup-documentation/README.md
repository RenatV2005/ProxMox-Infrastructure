# Physisches Backup mit tar

## Ziel

Ein physisches Backup sichert die echten Dateien und Ordner einer Anwendung.

Bei BookStack betrifft das beispielsweise:

- Uploads
- Bilder
- Konfigurationen
- Zertifikate
- APP_KEY
- Logs

In unserem Fall:

```text
bookstack-app/
├── backups/
├── keys/
├── nginx/
├── php/
└── www/
```

---

# Backup erstellen

```bash
sudo tar -czf backup/bookstack-app-backup.tar.gz bookstack-app
```

## Erklärung der Parameter

| Parameter | Bedeutung |
|-----------|-----------|
| c | create (Archiv erstellen) |
| z | gzip Komprimierung verwenden |
| f | Datei als Ziel verwenden |

Kurz gesagt:

```text
create + gzip + file
```

Dadurch entsteht:

```text
backup/
└── bookstack-app-backup.tar.gz
```

---

# Inhalt des Backups prüfen

Ein Backup gilt nicht automatisch als erfolgreich nur weil die Datei existiert.

Deshalb sollte der Inhalt geprüft werden:

```bash
sudo tar -tvf backup/bookstack-app-backup.tar.gz
```

## Erklärung

| Parameter | Bedeutung |
|-----------|-----------|
| t | table of contents anzeigen |
| v | verbose Ausgabe |
| f | Archivdatei verwenden |

---

# Beispielausgabe

```text
bookstack-app/
bookstack-app/keys/
bookstack-app/keys/cert.key
bookstack-app/www/
bookstack-app/www/uploads/
bookstack-app/www/uploads/images/
```

Dadurch wurde sichtbar, dass tar speichert:

- Dateien
- Ordner
- Dateirechte
- Besitzer
- UID
- GID
- Zeitstempel
- komplette Ordnerstruktur

---

# Restore durchführen

Die Wiederherstellung erfolgt mit:

```bash
sudo tar -xzf backup/bookstack-app-backup.tar.gz
```

## Erklärung

| Parameter | Bedeutung |
|-----------|-----------|
| x | extract |
| z | gzip Archiv |
| f | Datei verwenden |

Kurz:

```text
extract + gzip + file
```

---

# Ergebnis des Restores

Vor dem Restore:

```text
bookstack-app/
└── gelöscht oder beschädigt
```

Nach dem Restore:

```text
bookstack-app/
├── backups/
├── keys/
├── nginx/
├── php/
└── www/
```

Die komplette Struktur wird automatisch wiederhergestellt.

Es müssen keine Ordner manuell angelegt werden.

---

# Warum funktionierte Docker danach sofort wieder?

Docker Compose verwendet:

```yaml
volumes:
  - /home/renatubuntu/documentation/docker-compose2/bookstack-app:/config
```

Der Container erwartet beim Start:

```text
/config
```

Da tar exakt die ursprüngliche Struktur wiederherstellt, findet der Container beim Start alle benötigten Daten wieder:

- Uploads
- APP_KEY
- Konfiguration
- Zertifikate
- Bilder

Dadurch konnte BookStack direkt nach dem Restore wieder starten.

---

# Wichtigste Erkenntnis

Ein Backup ist erst dann wertvoll, wenn ein Restore erfolgreich getestet wurde.

```text
Backup
↓
Restore
↓
Service Recovery
```

Erst danach gilt ein Backup als verifiziert.

## Logisches Backup

Ein logisches Backup sichert nicht die Dateien der Datenbank, sondern deren Inhalt.

Beispiel:

Anstatt:

ibdata1
ib_logfile0
undo001

wird gespeichert:

CREATE TABLE books;
INSERT INTO books VALUES (...);

CREATE TABLE pages;
INSERT INTO pages VALUES (...);

Das Backup besteht also aus SQL-Befehlen.

Vorteile:

- Datenbank unabhängig vom Dateisystem
- Einzelne Tabellen können wiederhergestellt werden
- Migration auf andere Systeme möglich
- Sehr sicher bei Datenbanken

Nachteile:

- Restore dauert länger
- Sehr große Datenbanken benötigen länger für Export und Import

---

## Typische Enterprise Strategie

Dateien:
- physisches Backup

Datenbanken:
- logisches Backup

Beispiele:

Bookstack:
- bookstack-app -> physisch
- MariaDB -> logisch

Gitea:
- gitea-data -> physisch
- PostgreSQL -> logisch

Nextcloud:
- nextcloud-data -> physisch
- MariaDB/PostgreSQL -> logisch

Dies ist die Standardstrategie vieler Linux-Infrastrukturen.

sudo tar -czf backup/bookstack-app.tar.gz bookstack

- tar.gz zip in Directory backup/ erstellen von der Directory bookstack

sudo tar -tvf backup/bookstack-app.tar.gz 

- Inhalt prüfen

sudo tar -xzf backup/bookstack-app.tar.gz

docker compose down

mv bookstack-app bookstack-app.old

tar -xzf backup/bookstack-app-backup.tar.gz

docker compose up -d

- erstmal den aktuellen Zustand abspeichern, bevor man dies löscht 

docker exec docker-compose2-mariadb-datenbank-1 \
sh -c 'mariadb-dump -u root -p"$MARIADB_ROOT_PASSWORD" bootstackdb' \
> backup/bookstack-db-backup.sql

head backup/bookstack-db-backup.sql

- Version, Datenbank, Dump prüfen

grep "CREATE TABLE" backup/bookstack-db-backup.sql

- Tabellen prüfen 

grep "INSERT INTO" backup/bookstack-db-backup.sql

- Daten prüfen

less backup/bookstack-db-backup.sql

- SQL Datei lesen 

# PostgreSQL Cheat Sheet

## Verbindung zum Container

```bash
docker exec -it <container> bash
```

Beispiel

```bash
docker exec -it docker-compose3-postgres-1 bash
```

---

## PostgreSQL Client starten

```bash
psql -U postgres
```

oder

```bash
psql -U <Benutzer> -d <Datenbank>
```

Beispiel

```bash
psql -U gitea -d giteadb
```

---

# Datenbanken anzeigen

```sql
\l
```

(MariaDB)

```sql
SHOW DATABASES;
```

---

# Datenbank wechseln

```sql
\c giteadb
```

(MariaDB)

```sql
USE bootstackdb;
```

---

# Tabellen anzeigen

```sql
\dt
```

(MariaDB)

```sql
SHOW TABLES;
```

---

# Tabellenstruktur anzeigen

```sql
\d users
```

(MariaDB)

```sql
DESCRIBE users;
```

---

# Daten anzeigen

```sql
SELECT * FROM users;
```

---

# Nur einige Zeilen anzeigen

```sql
SELECT * FROM users LIMIT 5;
```

---

# PostgreSQL verlassen

```sql
\q
```

---

# Logisches Backup

```bash
docker exec postgres-container \
sh -c 'pg_dump -U postgres giteadb' \
> backup/giteadb.sql
```

---

# SQL-Datei ansehen

```bash
head backup/giteadb.sql
```

```bash
less backup/giteadb.sql
```

```bash
tail backup/giteadb.sql
```

---

# Restore

```bash
cat backup/giteadb.sql | docker exec -i postgres-container \
psql -U postgres giteadb
```

---

# Enterprise-Befehle

Datenbanken

```sql
\l
```

Tabellen

```sql
\dt
```

Tabellenstruktur

```sql
\d tabellenname
```

Benutzer

```sql
\du
```

Schemas

```sql
\dn
```

Aktuelle Verbindung

```sql
SELECT current_database();
```

Aktueller Benutzer

```sql
SELECT current_user;
```

## mein Befehl für PostgreSQL Restore

docker exec -i docker-compose3-postgres-1 \
psql -U gitea gitea \
< backup.sql
