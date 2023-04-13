#!/bin/sh

set -e

# Initialize database
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB database..."

    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db
    chown -R mysql:mysql /var/lib/mysql

    mariadbd --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS ${MYSQL_WORDPRESS_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED VIA mysql_native_password USING PASSWORD('${MYSQL_PASSWORD}');
GRANT ALL PRIVILEGES ON ${MYSQL_WORDPRESS_DATABASE}.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF

    echo "MariaDB database initialized."
fi

exec "$@"
