# Kenvix Contained web serivces

## PHP

PHP FPM Port: `9000`     
Default running on `192.168.170.2:9000`   

#### Pull

```shell
docker pull kenvix/php
```

#### Run

```shell
docker run -d --name php -v PATH_TO_WWW:PATH_TO_WWW --net contained --ip 192.168.170.2 kenvix/php
```

## Network 

```shell
docker network create --subnet=192.168.170.0/24 contained
```