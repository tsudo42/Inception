#!/bin/sh

set -e

if [ ! -e wp-config.php ]; then
    wp config create \
        --dbname="${MYSQL_WORDPRESS_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass=${MYSQL_PASSWORD} \
        --dbhost=mariadb

    wp core install \
        --url="https://${DOMAIN_NAME}" \
        --title="${WORDPRESS_TITLE}" \
        --admin_user="${WORDPRESS_ADMIN}" \
        --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
        --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
        --skip-email
fi

chown -R www-data:www-data /var/www/html/ && \
chown -R root:root /var/www/html/wp-config.php

if ! grep -q "WP_REDIS_HOST" wp-config.php; then
    wp config set WP_REDIS_HOST redis
fi
if ! grep -q "WP_REDIS_PORT" wp-config.php; then
    wp config set WP_REDIS_PORT 6379
fi
if ! grep -q "WP_REDIS_PASSWORD" wp-config.php; then
    wp config set WP_REDIS_PASSWORD "${REDIS_PASSWORD}" --quiet || \
    { echo "Error: Failed to set Redis password."; exit 1; }
fi

if ! wp plugin is-installed redis-cache; then
    wp plugin install redis-cache --activate
    wp redis enable
fi

if [ ! -e wp-content/object-cache.php ]; then
    cp wp-content/plugins/redis-cache/includes/object-cache.php wp-content/
fi

exec "$@"
