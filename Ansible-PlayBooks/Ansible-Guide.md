# Ansible Guide

## Was ist Ansible?

Ansible ist ein Configuration-Management- und Automatisierungswerkzeug.

Anstatt sich per SSH auf jeden Server einzuloggen und Befehle manuell auszuführen, verbindet sich Ansible über SSH mit allen Servern und führt die gewünschten Aufgaben automatisch aus.

Ansible arbeitet **agentenlos**.

Das bedeutet:

- Kein Agent muss auf den Zielservern installiert werden.
- Es wird lediglich SSH und Python benötigt.

---

# Homelab Architektur

```text
                   Debian Workstation
                    (Control Node)

                           │
                     SSH + Ansible

        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼

   Ubuntu DEV         Ubuntu TEST      Ubuntu PROD
   192.168.0.182      192.168.0.181    192.168.0.180
```

Der Debian-PC ist der **Control Node**.

Von hier aus werden alle Server verwaltet.

---

# Voraussetzungen

Alle Managed Nodes benötigen:

- SSH Server
- Python3

Prüfen:

```bash
python3 --version
```

---

# Ansible Installation

```bash
sudo apt update

apt search ansible

apt show ansible

sudo apt install ansible -y
```

Version prüfen

```bash
ansible --version
```

---

# Inventory

Das Inventory beschreibt alle Server, die Ansible verwalten soll.

Datei:

```text
inventory/homelab.ini
```

Beispiel:

```ini
[test]
ubuntu-test ansible_host=192.168.0.181 ansible_user=renattest

[prod]
ubuntu-prod ansible_host=192.168.0.180 ansible_user=renatubuntu

[dev]
ubuntu-dev ansible_host=192.168.0.182 ansible_user=renatdev
```

## Aufbau

```ini
ubuntu-dev
```

Inventory Hostname.

```ini
ansible_host
```

IP-Adresse.

```ini
ansible_user
```

SSH Benutzer.

---

# Verbindung testen

Alle Server anpingen

```bash
ansible all -i inventory/homelab.ini -m ping
```

Hostname anzeigen

```bash
ansible all -i inventory/homelab.ini -a "hostname"
```

Docker Version

```bash
ansible all -i inventory/homelab.ini -a "docker --version"
```

SSH Status

```bash
ansible all -i inventory/homelab.ini -a "systemctl status ssh"
```

---

# Module

Ein Modul ist eine einzelne Funktion von Ansible.

Beispiele

- ping
- service
- apt
- git
- copy
- file
- user

Modul verwenden

```bash
ansible all -m ping
```

Argumente übergeben

```bash
ansible all -a "hostname"
```

---

# Wichtige Befehle

Ad-hoc Befehl

```bash
ansible
```

Playbook ausführen

```bash
ansible-playbook
```

Dokumentation öffnen

```bash
ansible-doc
```

Inventory prüfen

```bash
ansible-inventory
```

Version

```bash
ansible --version
```

---

# ansible vs ansible-playbook

## ansible

Führt einen einzelnen Befehl bzw. ein Modul aus.

Beispiel

```bash
ansible all -a "hostname"
```

oder

```bash
ansible all -m ping
```

---

## ansible-playbook

Führt ein komplettes YAML Playbook aus.

Beispiel

```bash
ansible-playbook -i inventory/homelab.ini playbooks/show-vars.yml
```

---

# Projektstruktur

```text
ansible/

inventory/
playbooks/
roles/
templates/
files/
host_vars/
group_vars/
```

---

# host_vars

host_vars enthalten Variablen für **einen einzelnen Server**.

Wichtig:

Der Dateiname muss exakt dem Inventory Hostnamen entsprechen.

Beispiel

Inventory

```ini
ubuntu-dev ansible_host=192.168.0.182
```

Datei

```text
host_vars/ubuntu-dev.yml
```

---

## Beispiel

DEV

```yaml
repo_branch: feature/ansible

docker_user: renatdev

server_environment: dev
```

TEST

```yaml
repo_branch: main

docker_user: renattest

server_environment: test
```

PROD

```yaml
repo_branch: main

docker_user: renatubuntu

server_environment: prod
```

---

# Variablen verwenden

Syntax

```yaml
{{ variable }}
```

Beispiele

```yaml
{{ repo_branch }}

{{ docker_user }}

{{ inventory_hostname }}
```

---

# show-vars.yml

Erstes Test-Playbook.

Ziel:

Prüfen, ob host_vars korrekt geladen werden.

```yaml
---
- name: Zeige Host-Variablen
  hosts: all
  gather_facts: false

  tasks:

    - name: Zeige Variablen
      ansible.builtin.debug:
        msg:
          - "Server: {{ inventory_hostname }}"
          - "Environment: {{ server_environment }}"
          - "Branch: {{ repo_branch }}"
          - "Docker User: {{ docker_user }}"
```

---

# ansible-doc

Dokumentation aller Module.

Alle Module anzeigen

```bash
ansible-doc -l
```

Nach Modul suchen

```bash
ansible-doc -l | grep service

ansible-doc -l | grep apt

ansible-doc -l | grep git
```

Dokumentation öffnen

```bash
ansible-doc service

ansible-doc apt

ansible-doc git
```

Beim Lernen besonders wichtig:

- DESCRIPTION
- OPTIONS
- EXAMPLES

---

# Wichtige Erkenntnisse

Ansible trennt:

## Logik

Playbook

↓

Was soll passieren?

Beispiel

- Docker installieren
- Git installieren
- Repository klonen

---

## Daten

Variablen

↓

Mit welchen Werten?

Beispiel

- Branch
- Benutzer
- Hostname
- Repository
- Umgebung

Dadurch kann ein einziges Playbook für DEV, TEST und PROD verwendet werden.

---

# Nächster Schritt

bootstrap.yml

Ziele:

- Git installieren
- Docker installieren
- Docker Compose installieren
- Docker starten
- Docker beim Booten aktivieren

Später:

- Repository klonen
- Branch abhängig von host_vars auswählen
- Docker Compose deployen