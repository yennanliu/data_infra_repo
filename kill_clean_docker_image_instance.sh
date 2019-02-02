#!/bin/sh

function kill_all_docker_image_instance(){
	echo 'STOP --------------------------'
	docker stop $(docker ps -aq)
	echo 'REMOVE --------------------------'
	docker rm $(docker ps -aq)
	docker rmi $(docker images -q)
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q -a)
}

function kill_VA_docker_image_instance(){
    # https://github.com/astronomer/astronomer/blob/master/bin/build-airflow
	VA_docker_container=`docker ps --format '{{.Names}}' | grep "${va_docker_container_name}"`
	VA_docker_image=`docker images | grep -E '${va_docker_image_name}' | awk '{print $1}'`
	VA_docker_image_id=`docker images | grep -E '${va_docker_image_name}' | awk '{print $3}'`
	echo 'STOP --------------------------'
	for container in ${VA_docker_container}; 
	do
	echo "kill docker container $container" &&  docker stop $container; 
	done; 
	echo 'REMOVE --------------------------'
	for image_id in ${VA_docker_image_id}; 
	do 
	echo "docker rm image_id $image_id" && docker rm  $image_id; 
	echo "docker rmi image_id $image_id" && docker rmi  $image_id ; 
	done; 
}

function kill_xbot_airflow_docker_image_instance(){
	all_docker_container=`docker ps --format '{{.Names}}'`
	xbot_docker_container=`docker ps --format '{{.Names}}' | grep "xbot"`
	xbot_docker_image=`docker images | grep -E 'postgres|x-bot/airflow|astronomerinc/ap-airflow' | awk '{print $1}'`
	xbot_docker_image_id=`docker images | grep -E 'postgres|x-bot/airflow|astronomerinc/ap-airflow' | awk '{print $3}'`
	echo 'STOP --------------------------'
	for container in ${xbot_docker_container}; 
	do
	echo "kill docker container $container" &&  docker stop $container; 
	done; 
	echo 'REMOVE --------------------------'
	for image_id in ${xbot_docker_image_id}; 
	do 
	echo "docker rm image_id $image_id" && docker rm  $image_id; 
	echo "docker rmi image_id $image_id" && docker rmi  $image_id ; 
	done; 
}

# kill xbot astro dockers 
kill_xbot_airflow_docker_image_instance


# kill VA dockers 
#for $va_docker_image_name in ${VA_DOCKER_IMAGES_NAME} ; do
#    kill_VA_docker_image_instance  "${va_docker_image_name}"
