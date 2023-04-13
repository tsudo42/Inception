#!/bin/sh

set -e

if [ ! -e wp-config.php ]; then
	wp config create --dbname="${MYSQL_WORDPRESS_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb
	wp core install --url="${DOMAIN_NAME}" --title="${WORDPRESS_TITLE}" --admin_user="${WORDPRESS_ADMIN}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --skip-email
fi

exec "$@"
