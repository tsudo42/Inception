#!/bin/sh

set -e

sed -i -r "s/\\$\\{IRC_PASSWORD\\}/${IRC_PASSWORD}/g" /etc/ngircd/ngircd.conf

echo "Starting irc..."

exec "$@"
