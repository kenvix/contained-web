FROM alpine:3.11.3

RUN apk --no-cache add php7 php7-dev php7-pear php7-openssl openssl-dev g++ make \
    && apk --no-cache add php7-fpm php7-mysqli php7-json php7-curl \
        php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
        php7-mbstring php7-gd php7-bcmath php7-tokenizer php7-fileinfo php7-xmlwriter \
        php7-opcache php7-mysqlnd php7-pdo php7-pdo_mysql php7-pecl-redis \
    && pecl install mongodb \
    && pecl install apcu \
    && echo 'extension=mongodb.so' > /etc/php7/conf.d/01_mongodb.ini \
    && echo 'extension=apcu.so' > /etc/php7/conf.d/01_apcu.ini \
    && rm -rf /var/cache/apk/*

COPY www.conf /etc/php7/php-fpm.d/www.conf
COPY php.ini /etc/php7/conf.d/99_php_override.ini

CMD ["php-fpm7", "-F"]