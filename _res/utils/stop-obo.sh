#!/bin/sh
cd ~/docker/local-obo
docker-compose down
docker system prune -f
cd ~
