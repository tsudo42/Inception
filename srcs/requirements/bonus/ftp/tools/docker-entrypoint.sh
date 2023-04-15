#!/bin/sh

set -e

printf "${FTP_PASSWORD}\\n${FTP_PASSWORD}\\n" | \
pure-pw useradd "${FTP_USER}" -f "/etc/pureftpd.pdb" \
    -d "/var/www/html" -u www-data -g www-data -m

chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html
chmod 755 /var/www/html/wp-config.php

# if [ ! -e /etc/ssl/private/pure-ftpd.pem.php ]; then
if [ true ]; then
    mkdir -p /etc/ssl/private

    openssl req -new -x509 \
        -sha256 -newkey rsa:2048 -days 365 -nodes \
        -subj /CN=${DOMAIN_NAME} \
        -out /etc/ssl/private/pure-ftpd.pem \
        -keyout /etc/ssl/private/pure-ftpd.pem

    chown root:root -R /etc/ssl/private
    chmod 600 /etc/ssl/private/*
    chmod 700 /etc/ssl/private
fi

if ! pgrep -x "rsyslogd" > /dev/null; then
    echo "launch rsyslog..."
    rsyslogd -f /etc/rsyslog.conf
fi

exec "$@"
