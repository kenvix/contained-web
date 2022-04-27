#!/bin/bash

echo "Starting Tieba-Cloud-Sign docker version ..."

caddy run --config /etc/caddy/Caddyfile

exit $?