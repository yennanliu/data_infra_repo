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


function kill_astro_airflow_docker_image_instance(){

	all_docker_image=`docker ps --format '{{.Names}}'`
	xbot_docker_image=`docker ps --format '{{.Names}}' | grep "xbot"`
	echo 'STOP --------------------------'
	for image in ${xbot_docker_image}; 
	do
		echo "kill docker image $image"; 
	done; 

	echo 'REMOVE --------------------------'
	for image in ${xbot_docker_image}; 
	do 
		#docker rm $(docker ps -aq)
		#docker rmi $(docker images -q)
		#docker rm $(docker ps -a -q)
		#docker rmi $(docker images -q -a)
		echo "kill docker image $image"; 
	done; 

}


kill_astro_airflow_docker_image_instance
