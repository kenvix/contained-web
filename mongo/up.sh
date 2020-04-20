if [ ! -d /run/mongo  ];then
  mkdir /run/mongo
fi
chown -R root:docker /run/mongo
chmod -R 777 /run/mongo
docker-compose up -d