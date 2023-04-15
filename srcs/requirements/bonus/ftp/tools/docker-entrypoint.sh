#!/bin/sh

set -e

if ! id -u ${FTP_USER} &> /dev/null 2>&1; then
    adduser -D -h /var/www/html/ -s /sbin/nologin "${FTP_USER}"

    printf "${FTP_PASSWORD}\\n${FTP_PASSWORD}\\n" | \
    pure-pw useradd "${FTP_USER}" -f "/etc/pureftpd.pdb" \
        -d "/var/www/html" -u "${FTP_USER}" -g "${FTP_USER}" -m
fi

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
