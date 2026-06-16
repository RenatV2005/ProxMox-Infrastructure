# LVM Storage Expansion Cheat Sheet

## Szenario

Die virtuelle Festplatte wurde in Proxmox, VMware oder Hyper-V vergrößert.

Beispiel:

* Vorher: 30 GB
* Nachher: 100 GB

Linux verwendet aber weiterhin nur die ursprüngliche Größe.

---

# 1. Aktuellen Zustand prüfen

## Festplatten und Partitionen anzeigen

```bash
lsblk
```

Zeigt:

* Festplatten (sda, sdb ...)
* Partitionen (sda1, sda2, sda3 ...)
* LVM Volumes

Beispiel:

```text
sda     100G
└─sda3   30G
```

Festplatte ist größer als die Partition.

---

## Dateisystem prüfen

```bash
df -h
```

Zeigt:

* Größe des Dateisystems
* Verwendeten Speicher
* Freien Speicher

Beispiel:

```text
/dev/mapper/ubuntu--vg-ubuntu--lv
30G
```

---

## LVM prüfen

### Physical Volumes

```bash
sudo pvs
```

Zeigt:

* Physische Datenträger für LVM

---

### Volume Groups

```bash
sudo vgs
```

Zeigt:

* Gesamten Speicherpool
* Freien Speicher im Pool

---

### Logical Volumes

```bash
sudo lvs
```

Zeigt:

* Die eigentlichen Volumes
* Größe der Volumes

---

# 2. Partition erweitern

```bash
sudo growpart /dev/sda 3
```

Bedeutung:

* /dev/sda = Festplatte
* 3 = Partition Nummer 3

Aufgabe:

Vergrößert die Partition auf den maximal verfügbaren Speicher.

---

# 3. LVM Physical Volume erweitern

```bash
sudo pvresize /dev/sda3
```

Aufgabe:

LVM erkennt jetzt die neue Größe der Partition.

Kontrolle:

```bash
sudo pvs
```

Beispiel:

```text
PSize 100G
PFree 70G
```

---

# 4. Logical Volume erweitern

```bash
sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv -r
```

Bedeutung:

* +100%FREE = gesamten freien Speicher verwenden
* -r = Dateisystem automatisch mit erweitern

Aufgabe:

Freien Speicher aus der Volume Group dem Root-Dateisystem zuweisen.

---

# 5. Ergebnis prüfen

```bash
df -h
```

Beispiel:

Vorher:

```text
30G
```

Nachher:

```text
99G
```

---

# Merksatz

Storage-Erweiterung mit LVM:

Disk
↓
Partition
↓
PV (Physical Volume)
↓
VG (Volume Group)
↓
LV (Logical Volume)
↓
Filesystem

Wenn eine Disk größer wird:

1. growpart
2. pvresize
3. lvextend
4. df -h prüfen

---

# Schnellversion

```bash
lsblk

sudo growpart /dev/sda 3

sudo pvresize /dev/sda3

sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv -r

df -h
```
