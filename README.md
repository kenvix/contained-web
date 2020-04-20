# Kenvix Contained web serivces

## MySQL(MariaDB)

Default running on `192.168.170.3:3306`   
Unix socket on `/run/mysqld/mysqld.sock`

Data dir `/home/database/mysql`    
Default password `PASSWORD` user `app` and `root`

## MongoDB

Default running on `192.168.170.4:27017`   
Unix socket on `/run/mongo/mongodb-27017.sock`

Data dir `/home/database/mongo`    
Default password `PASSWORD` user `root`

## PHP
Size: 77 MiB

PHP-FPM Unix socket on `/run/php-fpm/php-fpm.sock`

#### Pull

```shell
docker pull kenvix/php
```

#### Run

```shell
mkdir /run/php-fpm
chown -R root:docker /run/php-fpm
chmod -R 777 /run/php-fpm
docker run -d --name php -v PATH_TO_WWW:PATH_TO_WWW --net contained -v /run/php-fpm:/run/php-fpm kenvix/php
```

## Nginx(Tengine)

Based on axizdkr/tengine

IT USES HOST NETWORK.

## Network 

```shell
docker network create --subnet=192.168.160.0/20 contained
```

in `/etc/docker/daemon.json`

```json
"bip":"192.168.180.1/20"
```

Custom Network Range: 192.168.160.1 ~ 192.168.175.254 