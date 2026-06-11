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

# 07.06.26

docker run -d \
--name nginx-web \
--network homelab-net \
-p 8080:80 \
-v /home/renatubuntu/documentation/Webserver:/usr/share/nginx/html \
-v /home/renatubuntu/documentation/nginx-config/default.conf:/etc/nginx/conf.d/default.conf \
--restart unless-stopped \
nginx

---
# 10.06.26

## Docker Network untersuchen

docker inspect docker-compose-nginx-webserver-1

* Image aus dem Dockerhub prüfen mit:
docker search apache2

* lokale images prüfen mit
docker images

* Image Details anschauen
docker inspect nginx