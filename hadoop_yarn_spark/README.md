### Quick start
```bash
git clone https://github.com/yennanliu/data_infra_repo.git
cd data_infra_repo/hadoop_yarn_spark
docker-compose up -d

# down the service 
docker-compose down
```
- Name node : localhost:8020
- Data node : localhost:50070
- Yarn : localhost:8088

### Install dependency
```bash
apt-get install nano vim -y
```

### Install python
```bash
apt-get update
apt-get install python -y
```

### Install scala & sbt
```bash
# https://hub.docker.com/r/srdc/scala/dockerfile
# install Scala
SCALA_VERSION=2.11.7
curl -sL http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | gunzip | tar -x -C /usr/local
cd /usr/local && ln -s ./scala-$SCALA_VERSION scala
SCALA_HOME=/usr/local/scala
PATH=${PATH}:${SCALA_HOME}/bin

# install SBT
SBT_VERSION=0.13.9
SBT_HOME=/usr/local/sbt
PATH=${PATH}:${SBT_HOME}/bin
curl -sL http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz | gunzip | tar -x -C /usr/local
cd /usr/local && ln -s ./sbt-$SBT_VERSION sbt
echo "-scala-home /usr/local/scala" ${SBT_HOME}/conf/sbtopts
```

### Ref
- https://www.jianshu.com/p/3ca4c759d3d8
- https://hub.docker.com/u/uhopper