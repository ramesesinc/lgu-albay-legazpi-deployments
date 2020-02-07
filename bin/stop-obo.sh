#!/bin/sh
RUN_DIR=`pwd`
cd ../local-obo
docker-compose down
docker system prune -f
cd $RUN_DIR
