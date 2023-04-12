FROM alpine:3.16.4

RUN apk update && apk add --no-cache \
    mariadb-client \
    php8 \
    php8-phar \
    php8-curl \
    php8-openssl \
    php8-fpm \
    php8-mysqli \
    php8-iconv

RUN wget 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar' && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/

RUN wp core download --path=/var/www/html

COPY ./conf/php-fpm.conf /etc/php8/php-fpm.conf
COPY ./conf/php-fpm.d /etc/php8/php-fpm.d

WORKDIR /var/www/html

EXPOSE 9000

STOPSIGNAL SIGQUIT

COPY tools/entrypoint.sh /tmp/entrypoint.sh
CMD ["sh", "/tmp/entrypoint.sh"]
