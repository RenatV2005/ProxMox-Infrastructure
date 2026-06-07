## Docker Volumes / Bind Mount

# einen Container mit Volume habe ich erstellt, indem ich zuerst meinen alten Nginx Container entfernt, mein Ziel war es, dass die index.html die im Container ist, ich direkt von dem Ubuntu Host, ändern und steuern kann :

docker run -d \
--name nginx-web \
-p 8080:80 \
-v /home/renatubuntu/documentation/Webserver:/usr/share/nginx/html \
nginx

# mit "-v /home/renatubuntu/documentation/Webserver:" habe ich den Pfad wo meine Index.html festgelegt, dieser pfad ist auf dem Ubuntu Host
# "/usr/share/nginx/html" das war schon der Pfad im Container drinnnen, somit konnte ich erfolgreich den Volume erstellen
# nach der Erstellung von Volume, habe ich mich auf dem nginx-web Container eingelogt und im /nginx/html habe ich erfolgreich meinen gewünschten index.html gefunden, somit war mein Ziel erreicht 

# Volume anschauen

docker volume ls

# Volume erstellen 

docker volume create nginx-data

# Details im Volume anschauen 

docker volume inspect nginx-data 


