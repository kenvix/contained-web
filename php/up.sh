if [ ! -f /usr/bin/php ];then
  cp php.sh /usr/bin/php
  chmod +x /usr/bin/php
fi

docker-compose up -d