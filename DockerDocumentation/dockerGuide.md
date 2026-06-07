# Images anzeigen

docker images

# Image herunterladen / lädt ein Image von Dockerhub herunter 

docker pull nginx

#  Container starten - einen neuen Container aus dem Image erstellen 

docker run nginx

# Container im Hintergrund starten d=detached

docker run -d nginx

# Port weiterleiten Host 8080-> Container 80

docker run -d --name nginx-test -p 8080:80 nginx

# Laufende Container anzeigen 

docker ps 

# Alle Container anzeigen

docker ps -a

# Logs Anzeigen / Live logs Anzeigen 

docker logs nginx-test / docker logs -f nginx-test 

# Im Container einloggen / wenn bash fehlt 

docker exec -it nginx bash  / docker exec -it nginx sh 

# Container verlassen 

exit 

# Container löschen

docker rm nginx-test

# gestoppten Container löschen 

docker stop nginx 
docker rm nginx

# Image löschen

docker rmi nginx

# erst Contianer löschen danach das Image - sonst image is being used by container 

# Container umbenennen 

docker rename altername neuername

# Vorhanden Container STARTEN / STOPPEN

docker start nginx-web / docker stop nginx-web 