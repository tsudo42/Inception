#!/bin/sh

set -e

sed -i -r "s/\\$\\{DOMAIN_NAME\\}/${DOMAIN_NAME}/g" /etc/nginx/conf.d/default.conf

echo "Starting nginx..."

exec "$@"
