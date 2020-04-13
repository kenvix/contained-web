if [ ! -d /var/run/mysqld  ];then
  mkdir /var/run/mysqld
fi
chown -R root:docker /var/run/mysqld
chmod -R 777 /var/run/mysqld
docker-compose up -d