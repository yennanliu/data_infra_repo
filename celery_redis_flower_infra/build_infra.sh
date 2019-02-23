#!/bin/sh

#################################################################
# SCRIPT HELP BUILD INFRA LOCAL 
#################################################################

# build the infra 
cd ~ && cd data_infra_repo/celery_redis_flower_infra
docker-compose -f  docker-compose.yml up 

# to add more workers 
docker-compose up -d --scale worker=5 --no-recreate

# to shut down
docker-compose down

# access redis CLI 
dokcker ps -a 
docker exec -it <redis_image_id> redis-cli

# access the services 
#Check the flower UI : http://localhost:5555/
# Run a "add" task : http://localhost:5001/add/1/2
# Run a "mul" task : http://localhost:5001/add/1/2
# Run a "web scrape" task : http://localhost:5001/scrap_task