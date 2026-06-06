# Docker Version prüfen 

docker --version

# meine Ausgabe = Docker version 29.1.3, build 29.1.3-0ubuntu4.1

# Docker Grundlagen

## Image herunterladen

docker pull nginx

## Container starten

sudo docker run -d -p 80:80 nginx

## Container anzeigen

sudo docker ps
