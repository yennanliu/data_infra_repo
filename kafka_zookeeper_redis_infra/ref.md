
## Ref
- https://docs.docker.com/samples/library/zookeeper/
- https://github.com/batux/personal_book_library_web_project
- https://docs.confluent.io/current/installation/docker/docs/installation/single-node-client.html

## Quick start 

#### single Zookeeper / single Kafka
```bash 
export export DOCKER_HOST_IP=127.0.0.1
docker-compose -f zk-single-kafka-single.yml up
docker-compose -f zk-single-kafka-single.yml down
```
Zookeeper will be available at `$DOCKER_HOST_IP:2181`
Kafka will be available at `$DOCKER_HOST_IP:9092`

### single Zookeeper / multiple Kafka

- dev 