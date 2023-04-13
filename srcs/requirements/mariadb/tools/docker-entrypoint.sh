#!/bin/sh

set -e

# c.f. --init-file /path/to/bootstrap.sql

mariadbd --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS ${MYSQL_WORDPRESS_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED VIA mysql_native_password USING PASSWORD('${MYSQL_PASSWORD}');
GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF

exec "$@"
