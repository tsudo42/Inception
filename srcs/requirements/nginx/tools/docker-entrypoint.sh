#!/bin/sh

set -e

sed -i -r "s/\\$\\{DOMAIN_NAME\\}/${DOMAIN_NAME}/g" /etc/nginx/conf.d/default.conf

# if [ ! -e /etc/nginx/ssl/nginx.pem ]; then
if [ true ]; then
    mkdir -p /etc/nginx/ssl

    openssl req -new -x509 \
        -sha256 -newkey rsa:2048 -days 365 -nodes \
        -subj /CN=${DOMAIN_NAME} \
        -out /etc/nginx/ssl/nginx.pem \
        -keyout /etc/nginx/ssl/nginx.pem

    chown root:root -R /etc/nginx/ssl
    chmod 600 /etc/nginx/ssl/*
    chmod 700 /etc/nginx/ssl
fi

echo "Starting nginx..."

exec "$@"
