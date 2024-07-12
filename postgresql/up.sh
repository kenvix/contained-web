if [ ! -d /var/run/mysqld  ];then
  mkdir /var/run/mysqld
fi
chown -R root:docker /var/run/mysqld
chmod -R 777 /var/run/mysqld
if [ ! -f /usr/bin/mysql  ];then
  cp mysql /usr/bin/mysql
fi
docker-compose up -d