#!/bin/bash

#################################################################
# SCRIPT HELP SET UP MYSQL DOCKER   
#################################################################

build_docker_mysql(){
echo 'build docker...'
docker build -t mysql_env .
}

run_mysql_container(){
echo 'start mysql container in background...'
docker run -it -d -p 3306:3306 --name mysql_env \
-e MYSQL_ALLOW_EMPTY_PASSWORD=True  mysql_env	
}

access_docker_mysql(){
echo 'access mysql...'
sleep 5 # wait till mysql init process finish
docker exec -it mysql_env /usr/bin/mysql -u root  
}

build_docker_mysql
run_mysql_container
access_docker_mysql