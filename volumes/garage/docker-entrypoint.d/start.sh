#!/usr/bin/env bash

set -eu

if [ -f /INIT ]; then
    echo "already init"
else
    echo "Init file not found, initializing"
    echo "Creating config file"
    perl -pe 's/\${([_A-Z0-9]+)}/$ENV{$1}/g' /opt/garage/garage.toml.tmpl > /etc/garage.toml

    /usr/bin/env bash /docker-entrypoint.d/setup.sh &
fi

exec "$@"
