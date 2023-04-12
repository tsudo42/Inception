#!/bin/sh

# c.f. --init-file /path/to/bootstrap.sql

mariadbd --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

CREATE DATABASE ${MYSQL_WORDPRESS_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED VIA mysql_native_password USING PASSWORD('${MYSQL_PASSWORD}');
GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF

exec mariadbd --user=mysql
