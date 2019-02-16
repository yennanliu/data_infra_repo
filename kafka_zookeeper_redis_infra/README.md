
## Ref
- https://github.com/simplesteph/kafka-stack-docker-compose
- https://docs.docker.com/samples/library/zookeeper/
- https://github.com/batux/personal_book_library_web_project
- https://docs.confluent.io/current/installation/docker/docs/installation/single-node-client.html

## Quick start 

### single Zookeeper / single Kafka

```bash 
export export DOCKER_HOST_IP=127.0.0.1
docker-compose -f zk-single-kafka-single.yml up
docker-compose -f zk-single-kafka-single.yml down
```
- Zookeeper will be available at `$DOCKER_HOST_IP:2181`
- Kafka will be available at `$DOCKER_HOST_IP:9092`

### single Zookeeper / multiple Kafka

- dev 

### full stack 

```bash
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


