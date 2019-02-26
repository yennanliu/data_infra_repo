
# Intro

> A POC project build a data-collecting system run with single/multiple zookeeper/kafka and the UIs set up / monitor subjects/group...

- zookeeper  : build the foundation kafka need 
- kafka :  Intermedia collect/filter/dispense data
- redis  : backend (DB) save kafka data 


## Quick start 


- Step 1 : clone the repo

```bash
cd ~ && git clone https://github.com/yennanliu/data_infra_repo
```
- Step 2-a : build a single zookeeper-kafka infra

```bash
cd ~ && cd data_infra_repo/kafka_zookeeper_redis_infra
export export DOCKER_HOST_IP=127.0.0.1
docker-compose -f zk-single-kafka-single.yml up
docker-compose -f zk-single-kafka-single.yml down

```
	- Zookeeper  :  `$DOCKER_HOST_IP:2181`
	- Kafka :  `$DOCKER_HOST_IP:9092`


- Step 2-b : build a full-stack zookeeper-kafka infra

```bash 
cd ~ && cd data_infra_repo/kafka_zookeeper_redis_infra
export export DOCKER_HOST_IP=127.0.0.1
docker-compose -f full-stack.yml up
docker-compose -f full-stack.yml down

```
	- Single Zookeeper: `$DOCKER_HOST_IP:2181`
	- Single Kafka: `$DOCKER_HOST_IP:9092`
	- Kafka Schema Registry: `$DOCKER_HOST_IP:8081`
	- Kafka Rest Proxy: `$DOCKER_HOST_IP:8082`
	- Kafka Connect: `$DOCKER_HOST_IP:8083`
	- Zoonavigator Web: `$DOCKER_HOST_IP:8004`
	- Kafka Connect UI: `$DOCKER_HOST_IP:8003`
	- Kafka Topics UI: `$DOCKER_HOST_IP:8000`
	- Kafka Schema Registry UI: `$DOCKER_HOST_IP:8001`



## Ref
- https://github.com/simplesteph/kafka-stack-docker-compose
- https://docs.docker.com/samples/library/zookeeper/
- https://github.com/batux/personal_book_library_web_project
- https://docs.confluent.io/current/installation/docker/docs/installation/single-node-client.html







