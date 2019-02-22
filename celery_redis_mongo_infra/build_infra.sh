
#!/bin/sh


#################################################################
# SCRIPT HELP BUILD INFRA LOCAL 
#################################################################

cd ~ && cd data_infra_repo/celery_rabbitmq_cluster_infra
docker pull rabbitmq:latest
docker-compose build
docker-compose scale worker=5
docker-compose up