# pug/docker-php

Questo progetto è stato realizzato solamente a scopo didattico per illustrare i concetti principali
della containerizzazione, composizione e orchestrazione di container.


### Preparazione
Per avviare l'ambiente di sviluppo, è necessario avere:
 - Docker 18.09+
 - Docker-compose 1.23+
 
Eseguire:

Per avviare le immagini di sviluppo effettuare cp `docker-compose.override.yml.dist` `docker-compose.override.yml`
 
### Avvio

Eseguire:

`docker-compose up -d`

### Simulazione ambiente di produzione su Minikube:

`Minikube` fornisce un cluster Kubernetes a nodo singolo sul tuo pc. 


Per poter avere `minikube` dobbiamo avere Hypervisor installato sulla nostro pc.

Se non lo abbiamo scarichiamo ed installiamo [Virtulbox](https://www.virtualbox.org/)


##### Minikube
Di seguito le [istruzioni per l'installazione](https://github.com/kubernetes/minikube#installation) (Pre requisiti VirtualBox)

Per macOS:

```shell
brew cask install minikube
```

Per Linux:
```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

#### Kubectl
Necessiteremo anche di `kubectl`. `Kubectl` è il CLI tool per interagire con Kubernetes.

Su macOS:
```shell
brew install kubernetes-cli
```

Su Linux Ubuntu/Debian:
```shell
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```


In aggiunta, sarebbe indicato avere anche i seguenti tool di utilità `kubectx` and `kubens` [(instruzioni per l'installazione)](https://github.com/ahmetb/kubectx#installation), non sono rischiesti ma sono comodi.

### Usare Minikube

Lanciare i seguenti comandi per avviare il cluster  minikube e linkarlo alla tua configurazione di docker.

```shell
minikube start --cpus=2 --memory=8192
# Verificare la presenza dei nodi
kubectl get pods
eval $(minikube docker-env)
docker ps
```

#### Utilizzo di minikube per il progetto

Eseguire i seguenti passi:

1. `minikube ssh` per accedere a minikube
2. Lanciare `docker pull docker pull poldotz/pug-nginx`, `docker pull docker pull poldotz/pug-php-fpm`


Per stoppare minikube senza distruggerla lanciare `minikube stop`

