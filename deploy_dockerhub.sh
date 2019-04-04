#!/bin/sh

#################################################################
# SHELL SCRIPT DEPLOY DOCKER IMAGE TO DOCKER HUB 
#################################################################

echo ' ---------------- DEPLOY TO DOCKER HUB ----------------'

declare -a docker_images=("celery_redis_flower_infra/."  "flask_mysql_postgre_infra/.")

for docker_image in "${docker_images[@]}"
	do 
		instance_name="$(cut -d'/' -f1 <<<"$docker_images")"
		container_id="` docker ps -a | awk 'FNR == 2 {print $1}'`" && echo container_id = $container_id && image_id="` docker ps -a | awk 'FNR == 2 {print $2}'`" && echo image_id = $image_id 
		# docker deploy 
		echo 'COMMIT & DEPLOY  : ' $docker_image  && docker commit $container_id yennanliu/$docker_image:V1 && docker push yennanliu/$docker_image:V1

	done 