# Monitoring

## CPU Busy

Wie viel Prozent der CPU gerade arbeitet
* 0-30% Normal
* 30-70% Beobachten 
* 70-90% Verdächtig
* 90%+ Kritisch

* Bsp: "apt update" CPU steigt - Normal
* "find / -type f" CPU steigt - Normal

## System load

Wie viele Prozesse auf CPU oder I/O warten

* Bsp: 2 Kerne
* Load: 0.5 - alles entspannt
* Load: 2.0 - CPU voll ausgelastet
* Load:10.0 - Katastrophe - 8 Prozesse warten permanent

## RAM Used

Arbeitspeicher Nutzung

## SWAP Nutzung

Wenn RAN voll wird > SWAP, Swap liegt auf Disk (langsam)
* 0% - Gut
* 10-20% - Beobachten
* 50%+ - Problematisch 

## Root FS Used

Wie voll ist das Linux-Dateisystem

## Network Traffic

eingehender und ausgehender Traffic

## Pressure

PSI = Pressure Stall Information
* CPU, RAM, I/0 Druck 
* > wie Stark Prozesse warten müssen

## Uptime

Wie lange läuft der Server

## Was überwacht ein Devops wirklich?

Morgens :
* 1) Alerts prüfen: Disk voll? Server down? CPU kritisch? 
* 2) Grafana anschauen: CPU, RAM, Load, Storage
* 3) Logs: Brauchen wir mehr RAM? mehr CPU? Mehr Storage?

## Logs

journalctl 
* System Logs

jouurnalctl -b
* aktuelle Boot Logs 

journalctl -p err
* Letzte Fehler

journalctl -f 
* Live Logs 

## Docker Logs

docker logs Containername
docker logs -f Containername

## System Load

uptime
* somit kriegen wir die Load-Werte
* 2 Kerne:
* Bsp: Load 0.5 > CPU ist größtenteils entspannt
* Bsp: Load 2.0 > beide Kerne haben arbeit
* Bsp: Load 4.0 > beide Kerne arbeiten und zusätzlich warten Prozesse

Rechnung mit Grafana Zahlen:
* Bsp: Load= 0.18, CPU = 2 Kerne > 0.18 : 2 = 0.09 = 9% 
* Deswegen immer für extra Monitoring am Server
cat /proc/loadavg
uptime

# Linux Log Analyse Cheat Sheet

# Grundprinzip

Logs bestehen aus:

Zeitstempel
↓
Service
↓
Severity
↓
Nachricht

Beispiel:

Jun 18 12:00:00 sshd:
Accepted password for renatubuntu

---

# Die wichtigste Regel

Niemals:

journalctl

machen.

Zu viel Müll.

Immer filtern.

---

# Service Logs

Docker

```bash
journalctl -u docker
```

SSH

```bash
journalctl -u ssh
```

Network

```bash
journalctl -u systemd-networkd
```

Nginx Service

```bash
journalctl -u nginx
```

---

# Nur Fehler

```bash
journalctl -p err
```

Bedeutung:

p = priority

err = Fehler

---

Nur Docker Fehler

```bash
journalctl -u docker -p err
```

Nur SSH Fehler

```bash
journalctl -u ssh -p err
```

Nur Netzwerk Fehler

```bash
journalctl -u systemd-networkd -p err
```

---

# Zeitfilter

Heute

```bash
journalctl --since today
```

Letzte Stunde

```bash
journalctl --since "1 hour ago"
```

Seit 09:00

```bash
journalctl --since "09:00"
```

---

# Kombinationen

Docker Fehler von heute

```bash
journalctl -u docker -p err --since today
```

SSH Fehler letzte Stunde

```bash
journalctl -u ssh -p err --since "1 hour ago"
```

---

# Letzte Zeilen

Letzte 20

```bash
journalctl -n 20
```

Letzte 100

```bash
journalctl -n 100
```

Docker letzte 50

```bash
journalctl -u docker -n 50
```

---

# Live Logs

System

```bash
journalctl -f
```

Docker

```bash
journalctl -u docker -f
```

SSH

```bash
journalctl -u ssh -f
```

---

# grep benutzen

Error suchen

```bash
journalctl | grep -i error
```

Failed suchen

```bash
journalctl | grep -i failed
```

Docker suchen

```bash
journalctl | grep -i docker
```

SSH suchen

```bash
journalctl | grep -i ssh
```

---

# Docker Logs

Container Logs anzeigen

```bash
docker logs CONTAINER
```

Live Logs

```bash
docker logs -f CONTAINER
```

Letzte 50 Zeilen

```bash
docker logs --tail 50 CONTAINER
```

---

# Docker + grep

Errors suchen

```bash
docker logs CONTAINER 2>&1 | grep -i error
```

Warnungen suchen

```bash
docker logs CONTAINER 2>&1 | grep -i warn
```

---

# Analyse Workflow

Server Problem
↓
Grafana Alert
↓
Welcher Service?
↓
journalctl -u SERVICE -p err
↓
docker logs CONTAINER
↓
Root Cause finden
↓
Fixen

---

# Typische Interpretation

Docker

"Daemon has completed initialization"

→ Docker erfolgreich gestartet

---

SSH

"Accepted password"

→ Login erfolgreich

---

SSH

"Failed password"

→ Login fehlgeschlagen

---

Network

"DHCP lease acquired"

→ IP erfolgreich erhalten

---

Network

"DHCP lease lost"

→ Verbindung verloren

---

# Was ist wirklich kritisch?

Kritisch:

error
failed
panic
crash
out of memory
segmentation fault

---

Normal:

Accepted password
Started service
Stopped service
DHCP acquired
Container started

---

# DevOps Regel

Nicht 10.000 Zeilen lesen.

Erst filtern.

Dann analysieren.

ps aux --sort=-%cpu | head
- Top CPU Prozesse 

docker logs docker-compose-cadvisor-1 | grep -A 10 cpu
- zeige 10 Logs nach dem Wort Cpu

stat -fc %T /sys/fs/cgroup
- Zeige mir den Typ des Dateisystems, welches hinter /sys/fs/cgroup liegt