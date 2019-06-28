#!/bin/sh

#################################################################
# SHELL SCRIPT BUILD DOCKER INSTANCE FOR TRAVIS CI   
#################################################################

echo ' ---------------- BUILD ALL REPO DOCKER IMAGES ----------------'

declare -a docker_images=("celery_redis_flower_infra/."  "flask_mysql_postgre_infra/." "mlflow_infra/." "zeepelin_elasticsearch_infra/.")

for docker_image in "${docker_images[@]}"
 do 
  instance_name="$(cut -d'/' -f1 <<<"$docker_images")"
  # docker build 
  echo 'docker bulid : ' $docker_image  && docker build $docker_image -t $instance_name	
  # run test 
  docker run -it $instance_name  echo 'docker test 123'	
 done 
