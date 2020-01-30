#!/bin/sh
docker system prune -f

cd ~/docker/etracs
docker-compose up -d
sleep 5

cd ~/docker/mail
docker-compose up -d

cd ~/docker/gdx-client
docker-compose up -d

cd ~/docker/queue
docker-compose up -d

cd ~/docker/local-obo
docker-compose up -d

cd ~
