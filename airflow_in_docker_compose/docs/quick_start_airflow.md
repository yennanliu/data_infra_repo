### Quick Start

1. Launch airflow via docker-compose
```bash
git clone https://github.com/DataEngDev/airflow_in_docker_compose.git
cd airflow_in_docker_compose

# v1
docker-compose -f docker-compose-2.0-with-celery-executor.yml up --buil

# v2
docker-compose -f docker-compose-with-celery-executor.yml up --build
# account, password : admin, admin
```

2. Install py packages
```bash
docker ps -a 

#docker exec -it 56d9da22d7cf bash
docker exec -it <airflow_in_docker_compose_worker_1's id> bash

pip install --upgrade pip
pip install pywebhdfs
```

3. Update connection
```bash
# step 1) login to postgre shell
psql -u airflow 

# step 2) select DB
\c airflow

# step 3) set up local ssh connection
INSERT INTO connection VALUES (456, 'hadoop@local', 'ssh', '192.168.0.178','','yennan.liu','<password>',22,'');

# step 4) double check
airflow=# 
airflow=# select * from connection;
 id  |   conn_id    | conn_type |     host      | schema |   login    |  password  | port | extra | is_encrypted | is_extra_encrypted 
-----+--------------+-----------+---------------+--------+------------+------------+------+-------+--------------+--------------------
 456 | hadoop@local | ssh       | 192.168.0.178 |        | yennan.liu | *** |   22 |       |              | 
(1 row)

# or check here 
# http://localhost:8080/admin/connection/
``` 


### Ref
- official docker build example
	- https://airflow.apache.org/docs/apache-airflow/stable/production-deployment.html