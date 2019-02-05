
#!/bin/sh


#################################################################
# SCRIPT HELP BUILD INFRA LOCAL 
#################################################################

cd ~ && cd /directory-of-dockerfile/
docker pull rabbitmq:latest
docker-compose build
docker-compose scale worker=5
docker-compose up