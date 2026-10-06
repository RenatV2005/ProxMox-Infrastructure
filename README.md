# 🐧 Linux DevOps Homelab

> Persönliches Linux-, Infrastruktur- und DevOps-Homelab mit Fokus auf modernen Enterprise-Standards, Automatisierung und reproduzierbarer Infrastruktur.

---

# 🎯 Projektziel

Dieses Homelab begleitet meinen persönlichen Weg vom IT-Support in Richtung Linux System Administration und DevOps.

Das Ziel besteht nicht darin, möglichst viele Docker-Container zu betreiben, sondern den Aufbau einer professionellen, wartbaren und reproduzierbaren Infrastruktur zu erlernen.

Dabei werden alle Komponenten zunächst manuell aufgebaut, verstanden, dokumentiert und anschließend schrittweise automatisiert.

Der Fokus liegt dabei zunehmend auf:

- Linux Administration
- Containerisierung
- Infrastructure as Code
- Konfigurationsmanagement
- CI/CD
- Automatisierung
- Monitoring
- reproduzierbaren Deployments
- Kubernetes
- Enterprise-orientierter Infrastruktur

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
| DEV Umgebung | ✅ |
| TEST Umgebung | ✅ |
| Ansible | ✅ |
| CI/CD | 🔄 |
| Terraform | ✅ |
| Terraform Associate | ✅ |
| Infrastructure as Code | ✅ |
| Cloud-Init | ✅ |
| SSH Automation | ✅ |
| Terraform Backend | 🔄 |
| Kubernetes | 🚀 Start |
| Helm | 📅 |
| High Availability | 📅 |

---

# 🖥️ Aktuelle Infrastruktur

## Betriebssysteme

- Ubuntu Server
- Ubuntu 26.04
- Debian Workstation
- Proxmox VE

## Infrastruktur

- 📈 Monitoring Stack
- 📚 Dokumentationsplattform
- 🗂️ Self-hosted Git Plattform
- 🌐 Reverse Proxy
- 💻 Eigener Webserver
- ⚙️ Bash Automatisierung
- ☁️ GitHub
- 🏠 Self-hosted Gitea
- 🔥 pfSense
- 🏗️ Terraform
- 🤖 Ansible
- ☸️ Kubernetes – in Aufbau

---

# 🏗️ Architektur

Die Infrastruktur basiert auf Proxmox VE und wird schrittweise von einer Docker-basierten Umgebung zu einer stärker automatisierten Infrastructure-as-Code- und Kubernetes-Umgebung weiterentwickelt.

```text
                                    Internet
                                        │
                                        │
                                    pfSense
                                        │
                              ┌─────────┴─────────┐
                              │                   │
                       Existing Services      Kubernetes
                              │                   │
                       Ubuntu Server        Kubernetes Cluster
                              │                   │
                         Docker Engine       ┌─────┴─────┐
                              │              │           │
      ┌───────────────┬───────┼──────────┐  Control    Worker
      │               │       │          │   Plane      Nodes
      │               │       │          │
 Monitoring     Dokumentation Git      Reverse
      │               │       │        Proxy
 Prometheus      BookStack   Gitea      Nginx
 Grafana         MariaDB    PostgreSQL
 Node Exporter
 cAdvisor


                Debian Workstation
                (Entwicklungsumgebung)

                       Git
                       Bash
                       Ansible
                       Terraform
                       CI/CD
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
- Host Monitoring
- Prometheus Targets
- Exporter

---

## 📚 Dokumentationsplattform

### Dienste

- BookStack
- MariaDB

### Erlernte Themen

- Persistente Daten
- Bind Mounts
- Docker Volumes
- Reverse Proxy
- Environment Variablen
- MariaDB
- Application Dependencies

---

## 🗂️ Git Plattform

### Dienste

- Gitea
- PostgreSQL

### Erlernte Themen

- Self-hosted Git
- PostgreSQL
- Repository Management
- Git Branches
- Feature Branches
- Pull Requests
- Docker Netzwerke
- Git-basierte Workflows

Gitea dient gleichzeitig als zentrale Git-Plattform für die Entwicklung und Dokumentation des Homelabs.

Das Repository wird zusätzlich auf GitHub veröffentlicht.

---

## 🌐 Reverse Proxy

### Dienste

- Nginx

### Erlernte Themen

- Reverse Proxy
- Docker DNS
- Virtuelle Hosts
- Container Kommunikation
- HTTP Routing
- Nginx Konfiguration
- Backend Services

---

# ⚙️ Infrastruktur-Automatisierung

Eigene Bash-Werkzeuge:

- `backup-manager.sh`
- `restore-manager.sh`
- `healthcheck.sh`
- `stack-manager.sh`
- `docker-status.sh`
- `system-report.sh`
- `compose-manager.sh`

### Ziele

- Service Management
- Health Checks
- Backup Automation
- Restore Workflows
- System Reports
- Docker Management

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

Damit wurde die Grundlage für Ansible, CI/CD und Infrastructure as Code geschaffen.

---

# 🤖 Ansible

Ansible wird zur Konfiguration und Automatisierung der Linux-Infrastruktur eingesetzt.

## Erlernte Themen

- Inventory
- Inventory Groups
- Host Variables
- Playbooks
- Tasks
- Modules
- `become`
- SSH Key Authentication
- Jinja2 Templates
- Idempotenz
- Remote Execution
- DEV / TEST / PROD Trennung

Ansible wird unter anderem verwendet, um virtuelle Maschinen auf dem Proxmox-System zu verwalten und Systeme reproduzierbar zu konfigurieren.

---

# 🏗️ Terraform / Infrastructure as Code

Terraform wurde inzwischen als Infrastructure-as-Code-Technologie in das Homelab integriert.

Die Infrastruktur wird deklarativ beschrieben und über den Proxmox Provider bereitgestellt.

## Terraform Architektur

```text
Terraform
    │
    ▼
Proxmox Provider
    │
    ▼
Proxmox VE
    │
    ├── Virtual Machine
    ├── Virtual Machine
    ├── Virtual Machine
    └── Virtual Machine
```

## Umgesetzte Terraform-Themen

- Terraform Configuration
- Provider
- Resources
- Variables
- `terraform.tfvars`
- `.gitignore`
- `for_each`
- Dynamic Blocks
- Resource Dependencies
- Terraform Plan
- Terraform Apply
- Terraform Validate
- Terraform State
- Proxmox Provider
- VM Cloning
- Infrastructure Reproducibility

---

# ☁️ Ubuntu 26.04 Cloud-Init Template

Für die automatisierte Bereitstellung von Ubuntu-VMs wurde ein eigenes **Ubuntu 26.04 Cloud-Init Template** auf Proxmox aufgebaut.

Der Template-Workflow:

```text
Ubuntu 26.04 Installation
          │
          ▼
     Cloud-Init
          │
          ▼
    SSH vorbereiten
          │
          ▼
Cloud-Init State bereinigen
          │
          ▼
SSH Host Keys zurücksetzen
          │
          ▼
Machine ID zurücksetzen
          │
          ▼
Cloud-Init Drive
          │
          ▼
Proxmox Template
          │
          ▼
Terraform Clone
          │
          ▼
Neue Ubuntu VM
```

Dadurch können neue Ubuntu-VMs reproduzierbar aus einem vorbereiteten Template erstellt werden.

Terraform übergibt dabei VM-spezifische Konfiguration an Cloud-Init.

Unter anderem können gesetzt werden:

- Hostname
- IP-Adresse
- Gateway
- Benutzer
- SSH Public Key
- weitere Initialisierungsdaten

---

# 🔐 SSH Automation

SSH wird für die automatisierte Kommunikation zwischen der Entwicklungsumgebung und den verwalteten Systemen verwendet.

Grundprinzip:

```text
Engineer / Automation Host
          │
          │ Private Key
          │
          ▼
         SSH
          │
          ▼
       Linux VM
          │
          │ Public Key
          ▼
~/.ssh/authorized_keys
```

Terraform bzw. Cloud-Init stellt den Public Key auf der Zielmaschine bereit.

Der Private Key bleibt auf der Automatisierungsmaschine.

Ansible verwendet anschließend den Private Key zur Authentifizierung auf den Zielsystemen.

---

# 🧪 Terraform Backend

Eine dedizierte Ubuntu-Backend-VM wurde mithilfe des neuen Cloud-Init-Templates und Terraform bereitgestellt.

Aktueller Workflow:

```text
Terraform
    │
    ▼
Proxmox
    │
    ▼
Ubuntu 26.04 Template
    │
    ▼
VM Clone
    │
    ▼
Cloud-Init
    │
    ├── Fixed IP
    ├── User
    └── SSH Key
```

Die VM soll anschließend als zentraler Terraform-State-Backend-Server eingesetzt werden.

Der Aufbau des Remote State Backends ist ein weiterer Schritt innerhalb der Infrastructure-as-Code-Architektur.

---

# 🔄 CI/CD

## Gitea Actions

Es wurde eine eigene CI/CD-Umgebung auf Basis von **Gitea Actions** aufgebaut.

### Komponenten

- Eigener Gitea Runner
- Eigene Docker CI Images
- Pipeline-as-Code über `.gitea/workflows`
- Automatische Ausführung nach Push
- Git-basierter Workflow

### Aktuelle Pipeline

Die CI-Pipeline wird schrittweise erweitert.

Bereits umgesetzt bzw. integriert:

- Docker Compose Validation
- Ansible Playbook Syntax Check

Weiterer Ausbau:

- Ansible Lint
- Terraform Format
- Terraform Validation
- Terraform Plan

Ziel:

```text
Developer
    │
    ▼
Git Commit
    │
    ▼
Gitea
    │
    ▼
Gitea Actions
    │
    ├── Docker Validation
    ├── Ansible Syntax Check
    ├── Ansible Lint
    ├── Terraform Format
    ├── Terraform Validate
    └── Terraform Plan
```

Dadurch sollen Fehler möglichst früh im Entwicklungsprozess erkannt werden.

---

# ☸️ Kubernetes

Nach Docker, Docker Compose, Ansible und Terraform beginnt nun der nächste große Abschnitt des Homelabs:

> **Kubernetes**

Das Ziel ist der Aufbau eines eigenen Kubernetes-Clusters auf Proxmox.

Dabei soll Kubernetes nicht nur theoretisch gelernt, sondern als reale Plattform im Homelab eingesetzt werden.

---

# 🧠 Kubernetes Lernziel

Das Kubernetes-Projekt soll auf den bereits vorhandenen Container-Erfahrungen aufbauen.

Bisher:

```text
Docker
    │
    ▼
Container
    │
    ▼
Docker Compose
    │
    ▼
Application Stack
```

Neu:

```text
Container Image
      │
      ▼
Kubernetes
      │
      ▼
Pod
      │
      ▼
Deployment
      │
      ▼
Service
      │
      ▼
Ingress
      │
      ▼
External Access
```

Docker bleibt dabei relevant für das Erstellen und Testen von Container Images.

Kubernetes übernimmt anschließend die Orchestrierung der Workloads.

---

# 🖥️ Geplante Kubernetes Architektur

Der erste Kubernetes-Cluster soll bewusst klein gehalten werden.

```text
                         Proxmox VE
                             │
             ┌───────────────┼───────────────┐
             │               │               │
             ▼               ▼               ▼
      k8s-control-01   k8s-worker-01   k8s-worker-02
             │               │               │
             └───────────────┴───────────────┘
                             │
                     Kubernetes Cluster
```

## Control Plane

Die Control Plane übernimmt unter anderem:

- Cluster Management
- Scheduling
- Desired State
- API
- Verwaltung der Workloads

## Worker Nodes

Worker Nodes führen die eigentlichen Workloads aus.

Dort laufen Kubernetes Pods und damit die eigentlichen Container-Anwendungen.

---

# 📦 Kubernetes Komponenten

Die wichtigsten Komponenten, die praktisch gelernt werden sollen:

- Cluster
- Control Plane
- Worker Nodes
- Pods
- Deployments
- ReplicaSets
- Services
- Ingress
- ConfigMaps
- Secrets
- Persistent Volumes
- Namespaces
- Scheduling
- Self-Healing
- Scaling
- Rolling Updates
- Container Runtime
- `containerd`
- `kubectl`
- Helm
- Kubernetes Networking
- Load Balancing
- Monitoring

---

# 🧱 Container Runtime

Kubernetes wird nicht direkt an Docker als Runtime gebunden.

Für den Kubernetes-Cluster soll eine CRI-kompatible Container Runtime eingesetzt werden.

Geplant:

```text
Kubernetes
     │
     ▼
CRI
     │
     ▼
containerd
     │
     ▼
Container
```

Docker bleibt weiterhin Bestandteil der Entwicklungs- und Image-Build-Umgebung.

Damit wird gleichzeitig der Unterschied zwischen:

- Container Image
- Container Runtime
- Container
- Kubernetes

praktisch nachvollziehbar.

---

# 🚀 Kubernetes Roadmap

## Phase 1 – Cluster Infrastructure

- Terraform
- Proxmox
- Kubernetes VMs
- feste IP-Adressen
- SSH
- Ansible

```text
Terraform
    │
    ▼
Proxmox
    │
    ├── Control Plane VM
    ├── Worker VM
    └── Worker VM
```

---

## Phase 2 – Kubernetes Installation

Installation und Konfiguration von:

- containerd
- kubeadm
- kubelet
- kubectl

Danach:

- Control Plane initialisieren
- Worker Nodes hinzufügen
- Cluster überprüfen

---

## Phase 3 – Erste Anwendung

Als erste Anwendung wird bewusst eine einfache Nginx-Anwendung eingesetzt.

Der Grund:

Nginx ist aus dem bestehenden Homelab bereits bekannt.

Dadurch liegt der Lernfokus auf Kubernetes und nicht auf einer neuen Anwendung.

```text
Deployment
    │
    ▼
ReplicaSet
    │
    ├── Nginx Pod
    ├── Nginx Pod
    └── Nginx Pod
```

---

## Phase 4 – Services

Ein Kubernetes Service stellt eine stabile Netzwerk-Abstraktion vor den Pods bereit.

```text
Client
   │
   ▼
Service
   │
   ├── Pod
   ├── Pod
   └── Pod
```

Dadurch kann sich die Anzahl und IP-Adresse einzelner Pods verändern, ohne dass Clients direkt von diesen Änderungen abhängig sind.

---

## Phase 5 – Self-Healing

Pods werden absichtlich beendet.

Beispiel:

```text
Pod 1  ❌
Pod 2  ✅
Pod 3  ✅
```

Kubernetes erkennt:

```text
Desired State = 3 Pods
Actual State  = 2 Pods
```

und startet einen neuen Pod.

```text
Pod 1  ❌
Pod 2  ✅
Pod 3  ✅
Pod 4  🆕
```

Damit wird das Kubernetes-Prinzip des **Desired State** praktisch untersucht.

---

## Phase 6 – Scaling

Untersucht werden:

- Replica Scaling
- Scheduling
- Resource Requests
- Resource Limits
- Node-Ausfälle
- Workload-Verteilung

Beispiel:

```text
1 Replica
    │
    ▼
3 Replicas
    │
    ▼
5 Replicas
```

---

## Phase 7 – Ingress

Nach den Grundlagen wird ein Ingress-System aufgebaut.

Ziel:

```text
Internet
    │
    ▼
Ingress
    │
    ├── Website
    ├── Gitea
    └── Monitoring
```

---

## Phase 8 – Load Balancing

Das Homelab soll langfristig einen realistischen externen Zugriff auf Kubernetes-Anwendungen ermöglichen.

Zielarchitektur:

```text
Internet
    │
    ▼
pfSense
    │
    ▼
Load Balancer
    │
    ▼
Kubernetes Ingress
    │
    ▼
Service
    │
    ├── Pod
    ├── Pod
    └── Pod
```

---

## Phase 9 – Helm

Nach den Kubernetes-Grundlagen wird Helm eingeführt.

Ziel:

- Helm Charts verstehen
- `values.yaml`
- Templates
- Releases
- parametrische Deployments
- wiederverwendbare Application Packages

Helm wird dabei bewusst **erst nach den Kubernetes-Grundlagen** eingeführt.

---

## Phase 10 – Monitoring

Die bestehende Monitoring-Infrastruktur soll langfristig auch Kubernetes überwachen.

Geplant:

- Kubernetes Metrics
- Pod Monitoring
- Node Monitoring
- Cluster Monitoring
- Grafana Dashboards
- Prometheus Integration

---

## Phase 11 – CI/CD

Kubernetes Deployments sollen langfristig in die bestehende Gitea-CI/CD-Infrastruktur integriert werden.

Ziel:

```text
Git Push
    │
    ▼
Gitea
    │
    ▼
CI/CD
    │
    ├── Tests
    ├── Build
    ├── Validation
    └── Deployment
            │
            ▼
       Kubernetes
```

---

# 🏢 Enterprise-orientierte Zielarchitektur

Langfristig soll das Homelab eine kleine, produktionsnahe Infrastrukturplattform abbilden.

```text
                                Internet
                                    │
                                    ▼
                                pfSense
                                    │
                                    ▼
                             Load Balancer
                                    │
                                    ▼
                           Kubernetes Ingress
                                    │
                   ┌────────────────┴────────────────┐
                   │                                 │
                   ▼                                 ▼
                Service                           Service
                   │                                 │
           ┌───────┴───────┐                 ┌──────┴──────┐
           ▼       ▼       ▼                 ▼             ▼
          Pod     Pod     Pod               Pod           Pod
           │                                 │
      Application                       Application
```

Die Infrastruktur darunter:

```text
                         Git
                          │
                 ┌────────┴────────┐
                 │                 │
               Gitea             GitHub
                 │
                 ▼
               CI/CD
                 │
        ┌────────┼────────┐
        │        │        │
   Terraform   Ansible  Kubernetes
        │        │        │
        ▼        ▼        ▼
     Proxmox   Linux    Workloads
        │
        ▼
       VMs
```

---

# 📂 Repository-Struktur

Aktuelle Struktur:

```text
documentation/
│
├── ansible/
├── cicd-stack/
├── Dockerfiles/
├── documentation-stack/
├── git-platform/
├── infrastructure/
├── infrastructure-tools/
├── Meine-Guides/
├── monitoring-stack/
├── reverse-proxy/
├── terraform/
├── web-stack/
└── README.md
```

Für Kubernetes wird ein eigener Bereich ergänzt:

```text
documentation/
│
├── kubernetes/
│   ├── README.md
│   ├── architecture/
│   ├── terraform/
│   ├── ansible/
│   ├── manifests/
│   ├── helm/
│   └── docs/
│
└── ...
```

---

# ⚙️ Technologien

## Betriebssysteme

- Ubuntu Server
- Ubuntu 26.04
- Debian
- Proxmox VE

## Container

- Docker
- Docker Compose
- containerd

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
- Ansible
- Jinja2
- Terraform

## Infrastructure as Code

- Terraform
- Proxmox Provider
- Cloud-Init

## CI/CD

- Gitea Actions
- Self-hosted Runner
- Pipeline-as-Code

## Kubernetes

- Kubernetes
- kubeadm
- kubelet
- kubectl
- containerd
- Helm
- Kubernetes Networking
- Ingress
- Services
- Deployments

---

# 🧠 Erlernte Technologien

- Linux Administration
- Docker
- Docker Compose
- Docker Netzwerke
- Container Lifecycle
- Volumes
- Bind Mounts
- Reverse Proxy
- Monitoring
- Git
- GitHub
- Gitea
- Bash
- Backup & Restore
- Ansible
- Jinja2
- CI/CD
- Terraform
- Infrastructure as Code
- Proxmox Automation
- Cloud-Init
- SSH Automation
- Infrastructure Documentation

---

# 📚 DevOps Konzepte

Während dieses Projekts wurden folgende DevOps-Prinzipien praktisch umgesetzt:

- Infrastructure as Code
- Continuous Integration
- Git Flow mit Feature Branches
- Pull Requests
- Konfigurationsmanagement mit Ansible
- Wiederverwendbare Templates mit Jinja2
- Containerisierung
- Reverse Proxy
- Monitoring
- Versionsverwaltung
- Automatisierung
- reproduzierbare Infrastruktur
- deklarative Infrastruktur
- Cloud-Init Provisioning
- automatisierte VM-Bereitstellung

---

# 📜 Zertifizierungen

## Microsoft Azure Fundamentals – AZ-900

**Bestanden**

Behandelte Themen:

- Cloud Concepts
- Azure Architecture
- Azure Services
- Identity
- Governance
- Security
- Pricing
- Management

---

## HashiCorp Certified: Terraform Associate

**Bestanden**

Die Zertifizierung ergänzt die praktische Terraform-Arbeit im Homelab.

Praktisch umgesetzt wurden unter anderem:

- Terraform Provider
- Resources
- Variables
- `for_each`
- Dynamic Blocks
- Terraform State
- Terraform Plan
- Terraform Apply
- Infrastructure as Code
- Proxmox VM Provisioning
- VM Cloning
- Cloud-Init
- SSH Key Injection

---

# 🚀 Roadmap

## ✅ Abgeschlossen

- Linux Grundlagen
- Linux Administration
- Docker
- Docker Compose
- Monitoring
- Reverse Proxy
- Self-hosted Git
- GitHub
- Bash Automation
- Backup & Restore
- Infrastruktur standardisiert
- DEV Umgebung
- TEST Umgebung
- Git Workflow
- Ansible
- Jinja2
- CI/CD Grundlagen
- Terraform
- Infrastructure as Code
- Proxmox Automation
- Ubuntu Cloud-Init Template
- Terraform VM Provisioning
- SSH Automation
- Microsoft AZ-900
- Terraform Associate

---

## 🔄 Aktuell

- CI/CD Ausbau
- Terraform in CI
- Ansible Lint
- Terraform Validation
- Terraform Plan in CI
- Terraform Backend
- Kubernetes Grundlagen
- Kubernetes Homelab
- containerd
- Kubernetes Networking

---

## 📅 Als Nächstes

- Kubernetes Cluster
- Control Plane
- Worker Nodes
- Pods
- Deployments
- Services
- Ingress
- Load Balancing
- Self-Healing
- Scaling
- Helm
- Kubernetes Monitoring
- Kubernetes CI/CD

---

## 🚀 Langfristige Ziele

- High Availability
- Network Segmentation
- Production-like Kubernetes
- Vollautomatische Deployments
- Infrastructure as Code
- Observability
- Disaster Recovery
- Backup Automation
- GitOps
- Publicly accessible services
- Enterprise-orientierte Infrastruktur

---

# 💡 Projektphilosophie

Dieses Homelab soll nicht nur zeigen, **wie Software installiert wird**, sondern vor allem **wie professionelle Infrastruktur entsteht**.

Der Fokus liegt darauf, Systeme so aufzubauen, dass sie:

- 📖 nachvollziehbar
- 📝 dokumentiert
- 🔄 reproduzierbar
- 🛠️ wartbar
- 🤖 automatisierbar
- 🔐 sicher
- 📈 überwachbar

sind.

Mein Ziel ist es, die Arbeitsweise eines modernen Linux- und DevOps-Engineers möglichst praxisnah in einem eigenen Homelab nachzubilden.

Dabei wird nicht einfach blind Software installiert.

Jede Technologie wird:

1. verstanden
2. manuell getestet
3. dokumentiert
4. automatisiert
5. validiert
6. in die bestehende Infrastruktur integriert

Jeder Sprint baut auf dem vorherigen auf und orientiert sich an Vorgehensweisen, wie sie auch in professionellen IT-Umgebungen eingesetzt werden.

---

# 🚀 Aktueller Fortschritt

Das Homelab hat sich von einer einfachen Docker- und Linux-Umgebung zu einer zunehmend automatisierten Infrastructure-as-Code-Plattform entwickelt.

Die bisherige Entwicklung:

```text
Linux
   │
   ▼
Docker
   │
   ▼
Docker Compose
   │
   ▼
Git / Gitea / GitHub
   │
   ▼
Ansible
   │
   ▼
CI/CD
   │
   ▼
Terraform
   │
   ▼
Cloud-Init
   │
   ▼
Automated VM Provisioning
   │
   ▼
Kubernetes
   │
   ▼
Helm
   │
   ▼
Automated Deployments
```

Der aktuelle Schwerpunkt liegt auf dem Übergang von einzelnen Container-Workloads zu **orchestrierten, reproduzierbaren Kubernetes-Workloads**.

Der nächste große Meilenstein ist daher:

> **Aufbau eines eigenen Kubernetes-Clusters auf Proxmox mit Terraform, Ansible und containerd.**

---

# 🌐 Repository

Das Projekt wird über eine selbst gehostete Gitea-Instanz entwickelt und zusätzlich auf GitHub veröffentlicht.

- Self-hosted Git: Gitea
- Public Repository: GitHub

Das Repository dient gleichzeitig als:

- technische Dokumentation
- Lernplattform
- Infrastructure-as-Code-Projekt
- DevOps-Labor
- Portfolio

für meine Entwicklung im Bereich:

**Linux · Infrastructure · Automation · DevOps · Kubernetes**