#!/bin/sh
cd ~/docker/local-obo
docker-compose down
docker system prune -f
sleep 1
docker-compose up -d
docker-compose logs -f local-obo-server
cd ~
