# Kenvix Contained web serivces

## MariaDB

Default running on `192.168.170.3:3306`   
Unix socket on `/var/run/mysqld/mysqld.sock`

Data dir `/home/database/mysql`    
Default password `PASSWORD` user `app`

## PHP
Size: 77 MiB

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
docker network create --subnet=192.168.160.0/20 contained
```

in `/etc/docker/daemon.json`

```json
"bip":"192.168.180.1/20"
```

Custom Network Range: 192.168.160.1 ~ 192.168.175.254 