# Git Cheatsheet
Datum: 04.07.2026

---

# 1. Repository erstellen

```bash
git init
```

Erstellt den versteckten `.git` Ordner.

Dieser Ordner sagt Git:

> Alles innerhalb dieses Verzeichnisses gehört zu diesem Repository.

Beispiel:

```
docker-compose3/
├── .git
├── compose.yaml
└── README.md
```

---

# 2. Prüfen ob ein Remote existiert

```bash
git remote -v
```

Leere Ausgabe:

> Repository existiert nur lokal.

Beispiel:

```
<keine Ausgabe>
```

---

# 3. Remote hinzufügen

## Gitea

```bash
git remote add gitea http://192.168.0.180:3001/gitea/gitea-stack.git
```

## Github

```bash
git remote add github git@github.com:Renat/repository.git
```

Der Name ist frei wählbar:

- gitea
- github
- backup
- work
- origin

`origin` ist nur ein Standardname.

---

# 4. Anzeigen wohin gepusht wird

```bash
git remote -v
```

Beispiel:

```
gitea   http://192.168.0.180:3001/gitea/gitea-stack.git (fetch)
gitea   http://192.168.0.180:3001/gitea/gitea-stack.git (push)
```

---

# 5. Dateien zum Commit hinzufügen

```bash
git add .
```

Wichtig:

`git add` entscheidet NICHT wohin gepusht wird.

Es fügt Dateien lediglich dem nächsten Commit hinzu.

---

# 6. Änderungen speichern

```bash
git commit -m "Beschreibung"
```

Beispiel:

```bash
git commit -m "Add README and compose file"
```

Ein Commit ist ein Snapshot des Projekts.

---

# 7. Branch auf main setzen

```bash
git branch -M main
```

Viele moderne Repositories nutzen `main`.

---

# 8. Erstes Pushen

## Gitea

```bash
git push -u gitea main
```

## Github

```bash
git push -u github main
```

`-u` bedeutet:

> Merke dir diese Verbindung dauerhaft.

Danach reicht meistens:

```bash
git push
```

---

# 9. Explizites Pushen

Ich verwende grundsätzlich:

```bash
git push gitea main
```

oder

```bash
git push github main
```

Dadurch ist sofort klar:

- welches Repository
- welcher Server
- welches Ziel

---

# 10. Status prüfen

```bash
git status
```

Der wahrscheinlich wichtigste Git Befehl.

Vor jedem Commit prüfen:

- Was wird committed?
- Ist .env dabei?
- Sind Datenbanken dabei?
- Sind Logs dabei?

---

# 11. .gitignore

Beispiel:

```gitignore
.env
postgres-daten/
gitea-daten/
*.log
```

`.gitignore` ignoriert nur Dateien die Git noch nicht kennt.

Bereits getrackte Dateien werden weiterhin verfolgt.

---

# Mentales Modell

Repository:

```
docker-compose3/
└── .git
```

Remote:

```
gitea
```

Push:

```bash
git push gitea main
```

Übersetzung:

> Schiebe meinen lokalen Branch "main"
> zum Remote "gitea"
> auf dessen Branch "main".

# Repositories finden

find ~/documentation -name ".git" -type d
git remote -v