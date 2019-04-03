#!/bin/sh

#################################################################
# SHELL SCRIPT BUILD DOCKER INSTANCE FOR TRAVIS CI   
#################################################################

echo ' ---------------- BUILD ALL REPO DOCKER IMAGES ----------------'
echo REGISTRY_USER = $REGISTRY_USER && echo REGISTRY_PASS = $REGISTRY_PASS

declare -a docker_images=("celery_redis_flower_infra/."  "flask_mysql_postgre_infra/.")
for docker_images in "${docker_images[@]}"
	do 
		echo 'docker bulid : $docker_images .... ' && docker build $docker_images
		#echo $docker_images
	done 
# run test 
#docker run -it Xbot_env_instance echo 'docker test 123'
