# Linux DevOps Homelab

> Personal Infrastructure Lab focused on Linux System Administration, Docker, Monitoring, Networking and DevOps.

---

# About this Project

This repository documents my personal Linux infrastructure running on a Proxmox server.

The goal of this homelab is not simply to install applications, but to understand how production-like infrastructure works by designing, deploying, troubleshooting and documenting every component myself.

Everything is built step by step while continuously learning Linux Administration, Docker, Networking, Git and modern Infrastructure concepts.

---

# Current Infrastructure

# Architecture Overview

```text
                                         Internet
                                             │
                                             │
                                      Ubuntu Server
                                   (Proxmox Virtual Machine)
                                             │
                                             │
                                      Docker Engine
                                             │
         ┌────────────────────┬────────────────────┬────────────────────┐
         │                    │                    │
         │                    │                    │
   Monitoring          Documentation            Git Platform
         │                    │                    │
         │                    │                    │
   Prometheus           BookStack               Gitea
   Grafana              MariaDB             PostgreSQL
   Node Exporter
   cAdvisor
         │
         │
 Reverse Proxy (Nginx)
         │
         │
 ─────────────────────────────────────────────────────────────────────────────

             Debian Workstation (Future Automation Runner)
                           │
                           ├── Git Development
                           ├── CI/CD Runner (planned)
                           ├── Ansible Control Node (planned)
                           └── Infrastructure Management

             Ubuntu Laptop (Monitoring Client)
                           │
                           └── Zabbix Agent
                                 │
                                 └── Monitoring Proxmox Host
```

## Monitoring Stack

Services

- Prometheus
- Grafana
- Node Exporter
- cAdvisor

Topics

- Docker Compose
- Docker Networking
- Host Monitoring
- Metrics Collection
- Dashboards
- Container Monitoring

---

## Documentation Stack

Services

- BookStack
- MariaDB

Topics

- Docker Compose
- Bind Mounts
- Persistent Storage
- Environment Variables
- Reverse Proxy
- MariaDB
- Laravel Applications

---

## Git Platform

Services

- Gitea
- PostgreSQL

Topics

- Self-hosted Git
- PostgreSQL
- Repository Management
- Docker Networking

---

## Reverse Proxy

Services

- Nginx

Topics

- Reverse Proxy
- Docker DNS
- Container Communication
- Virtual Hosts
- Nginx Configuration

---

# Infrastructure Automation

Current Scripts

- compose-manager.sh
- docker-status.sh
- healthcheck.sh

Topics

- Bash
- Infrastructure Automation
- Health Checks
- Service Management

---

# Repository Structure

```
documentation/

docker-compose/
docker-compose2/
docker-compose3/
docker-compose4/
docker-compose5/

tools/

nginx-config/

prometheus-config/

DockerDocumentation/

BackUp-Theorie/

README.md
```

---

# Technologies

## Operating Systems

- Ubuntu Server
- Debian
- Proxmox VE

## Containers

- Docker
- Docker Compose

## Monitoring

- Grafana
- Prometheus
- cAdvisor
- Node Exporter

## Databases

- MariaDB
- PostgreSQL

## Web

- Nginx
- Reverse Proxy

## Version Control

- Git
- GitHub
- Gitea

## Scripting

- Bash

---

# Skills Practiced

- Linux Administration
- Docker
- Docker Compose
- Docker Networks
- Bind Mounts
- Persistent Volumes
- Reverse Proxy
- Container Debugging
- Bash Automation
- Git
- GitHub
- Self-hosted Git
- Monitoring
- Backup Strategies
- Infrastructure Documentation

---

# Current Learning Roadmap

Completed

- Linux Basics
- Docker
- Docker Compose
- Monitoring Stack
- Reverse Proxy
- Self-hosted Git
- Bash Basics
- Backup Concepts

Currently Learning

- Linux Permissions
- Infrastructure Automation
- Git Workflow
- Advanced Bash

Planned

- CI/CD
- Ansible
- Terraform
- Kubernetes
- pfSense
- Infrastructure as Code
- High Availability

---

# Homelab Philosophy

The purpose of this repository is to understand **why** infrastructure works instead of simply deploying software.

Every project is built manually, debugged, documented and improved over time to simulate real-world Linux and DevOps administration.

---

# Future Goals

- Automated deployments
- Infrastructure as Code
- CI/CD Pipelines
- Multi-node Kubernetes Cluster
- Network Segmentation with pfSense
- Monitoring Improvements
- Backup Automation
- High Availability

---

# Contact

LinkedIn

GitHub

Always open to feedback, discussions and opportunities related to Linux, Infrastructure and DevOps.