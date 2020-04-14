if [ ! -d /home/config/nginx ];then
  if [ ! -d /home/config ];then
    mkdir -p /home/config
  fi
  cp -r nginx /home/config/nginx
  chown -R root:docker /home/config/nginx
  chmod -R 644 /home/config/nginx
fi
docker-compose up -d