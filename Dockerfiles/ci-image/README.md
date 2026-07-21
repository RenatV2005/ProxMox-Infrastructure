# Images 

- Wichtig:

git pull
docker build -t ci-image:3.0 Dockerfiles/ci-image

- somit bilden wir erstmal manuell das Image, welches wir durch pull als eine Datei übertragen, aber mit dem genannten Befehl wir BUILDEN es
- nach Jedem mal wenn man den Dockerfile ändert BITTE:

docker build -t ci-image:3.0 ./Dockerfiles/ci-image

docker run --rm -it ci-image:3.0 bash

- Image starten und in das Image kommen