# 🐧 Linux DevOps Homelab

> Persönliches Linux-, Infrastruktur- und DevOps-Homelab mit Fokus auf modernen Enterprise-Standards, Automatisierung und reproduzierbarer Infrastruktur.

---

# 🎯 Projektziel

Dieses Homelab begleitet meinen persönlichen Weg vom IT-Support in Richtung Linux System Administration und DevOps.

Das Ziel besteht nicht darin, möglichst viele Docker-Container zu betreiben, sondern den Aufbau einer professionellen, wartbaren und reproduzierbaren Infrastruktur zu erlernen.

Dabei werden alle Komponenten zunächst manuell aufgebaut, verstanden, dokumentiert und anschließend schrittweise automatisiert.

---

# 📊 Projektstatus

| Bereich | Status |
|----------|:------:|
| Linux Administration | ✅ |
| Docker | ✅ |
| Docker Compose | ✅ |
| Monitoring | ✅ |
| Reverse Proxy | ✅ |
| GitHub | ✅ |
| Self-hosted Gitea | ✅ |
| Bash Automation | ✅ |
| Backup & Restore | ✅ |
| DEV Umgebung | 🔄 |
| TEST Umgebung | 🔄 |
| Ansible | 📅 |
| CI/CD | 📅 |
| Terraform | 📅 |
| Kubernetes | 📅 |

---

# 🖥️ Aktuelle Infrastruktur

## Betriebssysteme

- Ubuntu Server (Proxmox VM)
- Debian Workstation

## Infrastruktur

- 📈 Monitoring Stack
- 📚 Dokumentationsplattform
- 🗂️ Self-hosted Git Plattform
- 🌐 Reverse Proxy
- 💻 Eigener Webserver
- ⚙️ Bash Automatisierung
- ☁️ GitHub
- 🏠 Self-hosted Gitea

---

# 🏗️ Architektur

```text
                                    Internet
                                        │
                                        │
                                Ubuntu Server
                             (Proxmox Virtual Machine)
                                        │
                                 Docker Engine
                                        │
      ┌───────────────┬────────────────┬────────────────┬───────────────┐
      │               │                │                │
 Monitoring     Dokumentation      Git Plattform     Reverse Proxy
      │               │                │                │
 Prometheus      BookStack         Gitea            Nginx
 Grafana         MariaDB           PostgreSQL
 Node Exporter
 cAdvisor


                Debian Workstation (Entwicklungsumgebung)

                       Git
                       Bash
                       Ansible (geplant)
                       CI/CD (geplant)
```

---

# 📦 Infrastruktur

## 📈 Monitoring Stack

### Dienste

- Prometheus
- Grafana
- Node Exporter
- cAdvisor

### Erlernte Themen

- Docker Compose
- Docker Networking
- Monitoring
- Dashboards
- Metriken
- Container Monitoring

---

## 📚 Dokumentationsplattform

### Dienste

- BookStack
- MariaDB

### Erlernte Themen

- Persistente Daten
- Bind Mounts
- Reverse Proxy
- Environment Variablen
- MariaDB

---

## 🗂️ Git Plattform

### Dienste

- Gitea
- PostgreSQL

### Erlernte Themen

- Self-hosted Git
- PostgreSQL
- Repository Management
- Docker Netzwerke

---

## 🌐 Reverse Proxy

### Dienste

- Nginx

### Erlernte Themen

- Reverse Proxy
- Docker DNS
- Virtuelle Hosts
- Container Kommunikation

---

# ⚙️ Infrastruktur-Automatisierung

Eigene Bash-Werkzeuge:

- backup-manager.sh
- restore-manager.sh
- healthcheck.sh
- stack-manager.sh
- docker-status.sh
- system-report.sh

---

# ✅ Sprint 1 – Infrastruktur standardisiert

Der erste Sprint bestand bewusst **nicht** darin, weitere Software zu installieren.

Stattdessen wurde die bestehende Infrastruktur nach Enterprise-Prinzipien überarbeitet.

## Umgesetzte Verbesserungen

- ✅ Einheitliche Repository-Struktur
- ✅ Portable Docker-Compose-Projekte
- ✅ Relative Pfade statt harter Verzeichnisse
- ✅ Standardisierte Bash-Skripte
- ✅ `.env.example` Vorlagen
- ✅ Backup- und Restore-Konzept
- ✅ Health Checks
- ✅ Infrastruktur-Dokumentation
- ✅ GitHub und Self-hosted Gitea synchronisiert
- ✅ Wartbare Projektstruktur geschaffen

### 💡 Ziel dieses Sprints

Eine Infrastruktur aufzubauen, die

- reproduzierbar
- portabel
- dokumentiert
- wartbar
- und für zukünftige Automatisierung vorbereitet

ist.

Damit ist die Grundlage für Ansible, CI/CD und Infrastructure as Code geschaffen.

---

# 📂 Repository-Struktur

```text
documentation/

├── ansible/
├── monitoring-stack/
├── documentation-stack/
├── git-platform/
├── reverse-proxy/
├── web-stack/
├── infrastructure-tools/
├── configs/
├── Dockerfiles/
├── Meine-Guides/
├── backup-documentation/
├── backups/
├── README.md
└── STACK-STANDARD.md
```

---

# ⚙️ Technologien

## Betriebssysteme

- Ubuntu Server
- Debian
- Proxmox VE

## Container

- Docker
- Docker Compose

## Monitoring

- Prometheus
- Grafana
- Node Exporter
- cAdvisor

## Datenbanken

- MariaDB
- PostgreSQL

## Webserver

- Nginx
- Reverse Proxy

## Versionsverwaltung

- Git
- GitHub
- Self-hosted Gitea

## Automatisierung

- Bash

---

# 🧠 Erlernte Technologien

- Linux Administration
- Docker
- Docker Compose
- Docker Netzwerke
- Reverse Proxy
- Monitoring
- Git
- Bash
- Backup & Restore
- Infrastruktur-Dokumentation
- Repository-Strukturierung
- Infrastruktur-Standardisierung

---

# 🚀 Roadmap

## ✅ Abgeschlossen

- Linux Grundlagen
- Docker
- Docker Compose
- Monitoring
- Reverse Proxy
- Self-hosted Git
- Bash
- Infrastruktur standardisiert

---

## 🔄 Als Nächstes

- DEV Umgebung
- TEST Umgebung
- Git Workflow
- Ansible
- CI/CD

---

## 📅 Langfristige Ziele

- Terraform
- Kubernetes
- Infrastructure as Code
- High Availability
- Vollautomatische Deployments

---

# 💡 Projektphilosophie

Dieses Homelab soll nicht nur zeigen, **wie Software installiert wird**, sondern vor allem **wie professionelle Infrastruktur entsteht**.

Der Fokus liegt darauf, Systeme so aufzubauen, dass sie:

- 📖 nachvollziehbar
- 📝 dokumentiert
- 🔄 reproduzierbar
- 🛠️ wartbar
- 🤖 automatisierbar

sind.

Mein Ziel ist es, die Arbeitsweise eines modernen Linux- und DevOps-Engineers möglichst praxisnah in einem eigenen Homelab nachzubilden.

Jeder Sprint baut auf dem vorherigen auf und orientiert sich an Vorgehensweisen, wie sie auch in professionellen IT-Umgebungen eingesetzt werden.
