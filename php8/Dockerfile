FROM alpine:3.15
LABEL maintainer="Kenvix <i@kenvix.com>"

ENV LANG=zh_CN.UTF-8 \
    TZ=Asia/Shanghai \
    PS1="\u@\h:\w \$ "

RUN apk update \
    && apk --no-cache add php8 php8-dev php8-pear php8-openssl openssl-dev g++ make \
    && apk --no-cache add php8-fpm php8-mysqli php8-json php8-curl php8-bz2 php8-ftp \
        php8-zlib php8-zip php8-xml php8-phar php8-intl php8-dom php8-xmlreader php8-ctype \
        php8-mbstring php8-gd php8-bcmath php8-tokenizer php8-fileinfo php8-xmlwriter php8-iconv \
        php8-opcache php8-mysqlnd php8-pdo php8-pdo_mysql php8-pecl-redis \
    && ln /usr/bin/pear8 /usr/bin/pear \
    && ln /usr/bin/peardev8 /usr/bin/peardev \
    && ln /usr/bin/pecl8 /usr/bin/pecl \
    && ln /usr/bin/phar.phar8 /usr/bin/phar.phar \
    && ln /usr/bin/phar8 /usr/bin/phar \
    && ln /usr/bin/php-config8 /usr/bin/php-config \
    && ln /usr/bin/php8 /usr/bin/php \
    && ln /usr/bin/phpize8 /usr/bin/phpize \
    && echo Installing Composer ... \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e5325b19b381bfd88ce90a5ddb7823406b2a38cff6bb704b0acc289a09c8128d4a8ce2bbafcd1fcbdc38666422fe2806') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=bin \
    && php -r "unlink('composer-setup.php');" \
    && pecl install mongodb \
    && pecl install apcu \
    && echo 'extension=mongodb.so' > /etc/php8/conf.d/01_mongodb.ini \
    && echo 'extension=apcu.so' > /etc/php8/conf.d/01_apcu.ini \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo -e "${TZ}" > /etc/timezone \
    && echo Cleaning up... \
    && apk del g++ make \
    && apk del *-dev \
    && rm -rf /var/cache/* \
    && rm -rf /usr/share/X11 \
    && rm -rf /tmp/pear \
    && mkdir /run/php-fpm/

COPY www.conf /etc/php8/php-fpm.d/www.conf
COPY 90-opcache.ini /etc/php8/conf.d/90-opcache.ini

WORKDIR /root
CMD ["php-fpm7", "-F"]