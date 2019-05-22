# pug/docker-php

## Ambiente di sviluppo
### Preparazione
Per avviare l'ambiente di sviluppo, è necessario avere:
 - Docker 18.09+
 - Docker-compose 1.23+
 
Eseguire:

`docker-compose build` per effettuare il build delle immagini di base

Per avere le immagini di sviluppo effettuare cp `docker-compose.override.yml.dist` `docker-compose.override.yml`
e poi eseguire `docker-compose -f docker-override.yml build ` per effettuare il build delle immagini di sviluppo

 
### Avvio

Eseguire:

`docker-compose up -d`
