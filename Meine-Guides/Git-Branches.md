# Git Branch Guide

# Was ist ein Branch?

Ein Branch ist eine eigene Entwicklungslinie innerhalb eines Git-Repositories.

Er ermöglicht es, neue Features oder Bugfixes zu entwickeln, ohne den stabilen Stand (`main`) zu verändern.

Beispiel:

main
```
A --- B --- C
```

feature/ansible
```
             \
              D --- E
```

Alle Commits A, B und C gehören automatisch auch zum neuen Branch.

Der Branch speichert **nur die Änderungen ab der Abzweigung**.

---

# Branch erstellen

## Neuen Branch erstellen und direkt wechseln

```bash
git checkout -b feature/cicd
```

oder (moderner)

```bash
git switch -c feature/cicd
```

---

# Branch auf Gitea veröffentlichen

```bash
git push -u origin feature/cicd
```

Das `-u` setzt den Upstream.

Danach reicht später:

```bash
git push
```

und

```bash
git pull
```

---

# Aktuellen Branch anzeigen

```bash
git branch
```

Beispiel

```
* feature/cicd
  feature/ansible
  main
```

Der Stern zeigt den aktuellen Branch.

---

# Alle Branches anzeigen

Lokale Branches

```bash
git branch
```

Remote Branches

```bash
git branch -r
```

Alle Branches

```bash
git branch -a
```

---

# Vor einem Branch-Wechsel

Immer zuerst prüfen:

```bash
git status
```

Wenn Änderungen vorhanden sind:

```
modified:
```

oder

```
Changes not staged for commit
```

dann entscheiden:

- Committen
- Verwerfen
- Stashen

---

# Änderungen committen

```bash
git add .
git commit -m "Beschreibung"
git push
```

---

# Änderungen verwerfen

Eine Datei

```bash
git restore datei.txt
```

Alle Änderungen

```bash
git restore .
```

---

# Änderungen zwischenlagern (Stash)

Speichern

```bash
git stash
```

Zurückholen

```bash
git stash pop
```

Alle Stashes anzeigen

```bash
git stash list
```

---

# Auf main wechseln

```bash
git checkout main
```

oder

```bash
git switch main
```

Vorher sollte immer

```bash
git status
```

sauber sein.

---

# Branch aktualisieren

```bash
git pull origin main
```

---

# Feature Branch in main mergen

Auf main wechseln

```bash
git checkout main
```

Aktualisieren

```bash
git pull origin main
```

Merge

```bash
git merge feature/cicd
```

Änderungen hochladen

```bash
git push origin main
```

---

# Branch löschen

## Vorher immer prüfen

Ist alles gemerged?

```bash
git log --oneline --graph --all
```

oder

```bash
git branch --merged
```

Wenn der Branch dort erscheint, kann er gelöscht werden.

---

# Lokalen Branch löschen

```bash
git branch -d feature/cicd
```

Git verweigert das Löschen, wenn noch nicht gemergte Commits existieren.

---

# Branch erzwingen löschen

Nur wenn wirklich gewollt.

```bash
git branch -D feature/cicd
```

Dabei gehen nicht gemergte Commits verloren.

---

# Remote Branch löschen

```bash
git push origin --delete feature/cicd
```

Danach verschwindet der Branch aus Gitea.

---

# Typischer Enterprise Workflow

1.

Neuen Branch erstellen

```bash
git checkout -b feature/cicd
```

2.

Entwickeln

```bash
git add .
git commit -m "Implement CI Pipeline"
git push
```

3.

Fertig entwickeln

4.

Auf main wechseln

```bash
git checkout main
```

5.

main aktualisieren

```bash
git pull origin main
```

6.

Feature mergen

```bash
git merge feature/cicd
```

7.

main hochladen

```bash
git push origin main
```

8.

Prüfen ob der Branch gemerged wurde

```bash
git branch --merged
```

9.

Lokalen Branch löschen

```bash
git branch -d feature/cicd
```

10.

Remote Branch löschen

```bash
git push origin --delete feature/cicd
```

---

# Merksatz

Vor jedem Branch-Wechsel:

```bash
git status
```

Vor jedem Branch-Löschen:

- Wurden alle Änderungen gemerged?
- Ist `main` aktuell?
- Wurde `main` gepusht?
- Erscheint der Branch bei `git branch --merged`?

Erst dann löschen.

---

# Branch-Strategie im Homelab

```
main
│
├── feature/ansible
├── feature/cicd
├── feature/terraform
├── feature/kubernetes
├── feature/monitoring
└── feature/cloud-init
```

- **main** → stabile Version (Produktion)
- **feature/** → Entwicklung neuer Funktionen
- Nach Abschluss wird der Feature-Branch in `main` gemergt und anschließend gelöscht.
