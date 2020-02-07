#!/bin/sh
RUN_DIR=`pwd`
cd ../../local-obo
docker-compose down
docker system prune -f
sleep 1
docker-compose -f docker-compose.yml -f docker-compose-test.yml up -d
docker-compose logs -f local-obo-server
cd $RUN_DIR
