#!/bin/sh
cd ~/docker/notification
docker-compose down
docker system prune -f
cd ~
