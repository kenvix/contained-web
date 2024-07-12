#!/bin/bash
docker pull vaultwarden/server:latest
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
"$SHELL_FOLDER/stop_bitwarden.sh"
"$SHELL_FOLDER/run_bitwarden.sh"


