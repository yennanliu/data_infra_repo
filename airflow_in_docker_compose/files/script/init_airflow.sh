#!/bin/sh

containers_id="`docker ps -a | grep airflow_in_docker_compose_worker_1 | awk '{print $1}'`"
echo $containers_id
docker exec -it $containers_id /bin/sh -c "cd files && python script/insert_conn.py"
docker exec -it $containers_id /bin/sh -c "cd files && python script/insert_variable.py"
docker exec -it $containers_id /bin/sh -c "cd files && python script/insert_pools.py"