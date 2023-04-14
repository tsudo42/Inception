#!/bin/sh

set -e

sed -i -r "s/\\$\\{REDIS_PASSWORD\\}/${REDIS_PASSWORD}/g" /etc/redis/redis.conf

exec "$@"
