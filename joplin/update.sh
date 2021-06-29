#!/bin/bash
docker pull joplin/server:latest
docker-compose down
docker-compose up -d
docker ps
