# Images anzeigen

docker images

# Image herunterladen / lädt ein Image von Dockerhub herunter 

docker pull nginx

#  Container starten

docker run nginx

# Container im Hintergrund starten d=detached

docker run -d nginx

# Container mit Namen starten 

docker run -d --name nginx-test nginx

# Port weiterleiten Host 8080-> Container 80

docker run -d --name nginx-test -p 8080:80 nginx

# Laufende Container anzeigen 

docker ps 

# Alle Container anzeigen

docker ps -a

# Container starten

docker run nginx 

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

# Volume mount 