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


function kill_xbot_airflow_docker_image_instance(){

	all_docker_container=`docker ps --format '{{.Names}}'`
	xbot_docker_container=`docker ps --format '{{.Names}}' | grep "xbot"`
	xbot_docker_image=`docker images | grep -E 'postgres|x-bot/airflow|astronomerinc/ap-airflow' | awk '{print $1}'`

	echo 'STOP --------------------------'
	for container in ${xbot_docker_container}; 
	do
		echo "kill docker container $container" &&  docker stop $container; 
	done; 
	
	echo 'REMOVE --------------------------'
	for image in ${xbot_docker_image}; 
	do 
		echo "docker rm image $image" && docker rm  $image; 
		echo "docker rmi image $image" && docker rmi  $image ; 
	done; 

}

kill_xbot_airflow_docker_image_instance

