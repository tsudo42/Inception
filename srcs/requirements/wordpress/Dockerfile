FROM alpine:3.16.4

RUN apk update && apk upgrade && apk add --no-cache \
    mariadb-client \
    php8 \
    php8-phar \
    php8-curl \
    php8-openssl \
    php8-fpm \
    php8-mysqli \
    php8-iconv \
    php8-redis

RUN adduser -S -D -H -G www-data www-data

RUN wget 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar' && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

RUN wp core download --path=/var/www/html

COPY ./conf/php-fpm.conf /etc/php8/php-fpm.conf
COPY ./conf/php-fpm.d /etc/php8/php-fpm.d

COPY --chmod=755 tools/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

STOPSIGNAL SIGQUIT

CMD ["php-fpm8", "-F", "-R"]
