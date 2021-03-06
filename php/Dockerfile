FROM alpine:3.11.3
LABEL maintainer="kenvix <i@kenvix.com>"

# sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \

RUN apk --no-cache add php7 php7-dev php7-pear php7-openssl openssl-dev g++ make \
    && apk --no-cache add php7-fpm php7-mysqli php7-json php7-curl php7-bz2 php7-ftp \
        php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
        php7-mbstring php7-gd php7-bcmath php7-tokenizer php7-fileinfo php7-xmlwriter php7-iconv \
        php7-opcache php7-mysqlnd php7-pdo php7-pdo_mysql php7-pecl-redis \
    && echo Installing Composer ... \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e5325b19b381bfd88ce90a5ddb7823406b2a38cff6bb704b0acc289a09c8128d4a8ce2bbafcd1fcbdc38666422fe2806') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=bin \
    && php -r "unlink('composer-setup.php');" \
    && pecl install mongodb \
    && pecl install apcu \
    && echo 'extension=mongodb.so' > /etc/php7/conf.d/01_mongodb.ini \
    && echo 'extension=apcu.so' > /etc/php7/conf.d/01_apcu.ini \
    && echo Cleaning up... \
    && apk del g++ make \
    && apk del *-dev \
    && rm -rf /var/cache/* \
    && rm -rf /usr/share/X11 \
    && rm -rf /tmp/pear \
    && rm -rf /usr/share/php7 \
    && mkdir /run/php-fpm/

COPY www.conf /etc/php7/php-fpm.d/www.conf
COPY php.ini /etc/php7/conf.d/99_php_override.ini

WORKDIR /root
CMD ["php-fpm7", "-F"]