# data_infra_repo
[![Build Status](https://travis-ci.org/yennanliu/data_infra_repo.svg?branch=master)](https://travis-ci.org/yennanliu/data_infra_repo)
[![PRs](https://img.shields.io/badge/PRs-welcome-6574cd.svg)](https://github.com/yennanliu/data_infra_repo/pulls)

> As `Data infra build` part of the "Daas (Data as a service) repo", this project shows how to build DS/DE environments via Docker from scratch. Will focus on : 1) System design by practical using cases 2) Docker, package, and libraries env setting up 3) Test, staging, and product develop/deploy workflow development (CI/CD style maybe)

* Daas (Data as a service) repo :  [Data infra build](https://github.com/yennanliu/data_infra_repo) -> [ETL build](https://github.com/yennanliu/XJob) -> [DS application demo](https://github.com/yennanliu/analysis)
* Airflow Heroku demo : [airflow-heroku-dev](https://github.com/yennanliu/airflow-heroku-dev)
* Mlflow Heroku demo : [mlflow-heroku-dev](https://github.com/yennanliu/mlflow-heroku-dev)

### File Structure 
```bash
# main projects
├── airflow_in_docker_compose
├── celery_redis_flower_infra
├── deploy_dockerhub.sh
├── hadoop_yarn_spark
├── kafka-zookeeper
├── kafka_zookeeper_redis_infra
├── mysql-master-slave
```

### TODO
- Hadoop
	- hadoop_yarn_spark (batch)
	- hadoop_yarn_spark (stream)
	- hadoop namenode, datanode
	- hadoop_yarn_flink
- Kafka
	- Kafka producer, consumer, zk
	- Kafka mirror
	- Kafka-ELK-DB
- airflow
	- airflow app in docker compose
- DB
	- DB sharding (partition)
	- DB replica
	- DB master-follower
	- DB master-master 
	- DB binary stream (kafka) to Bigquery/DW
	- DB binary stream ELK
- Microservice

### Test 
- [Play with Docker](https://labs.play-with-docker.com/)

### Ref 
- EG
	- https://docs.docker.com/compose/gettingstarted/
- ZH 
	- https://github.com/twtrubiks/docker-tutorial
	- https://zhuanlan.zhihu.com/p/36071226
