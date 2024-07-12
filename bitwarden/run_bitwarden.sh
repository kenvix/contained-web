#!/bin/bash
docker run -d --name bitwarden -e ADMIN_TOKEN=5j4BEKxefnxNwsNDnjVLmUtRBQUh7rfDN3TePFeeAEns9vhC9FDPqao78km2nYU46k7hGjK6mZUviVWfxzrKeTZhq7SHosXyzjWpSoB3Sc7z2SrCtvimPnJFWDQUosB9 -e WEBSOCKET_ENABLED=true -e SIGNUPS_ALLOWED=false -p 127.0.0.1:51851:80 -p 127.0.0.1:51852:3012 -v /home/services/bitwarden/data:/data --restart=unless-stopped vaultwarden/server:latest
