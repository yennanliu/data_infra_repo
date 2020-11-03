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
apt-get update
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

### Run spark jobs
```bash
# standalone 
spark-submit demo.py

# cluster
export HADOOP_CONF_DIR=/etc/hadoop 
spark-submit \
  --master yarn \
  --deploy-mode cluster \
  --conf spark.eventLog.dir=hdfs://nodemanager/mode/containerlogs \
  demo.py
```

### Ref
- Hadoop-spark-yarn docker
	- https://www.jianshu.com/p/3ca4c759d3d8
	- https://hub.docker.com/u/uhopper
	- https://github.com/infotechsoft/uhopper-hadoop-docker
	- https://yanwei-liu.medium.com/hadoop-spark%E5%AD%B8%E7%BF%92%E7%AD%86%E8%A8%98-%E4%B8%80-%E7%92%B0%E5%A2%83%E8%A8%AD%E5%AE%9A-%E5%AE%89%E8%A3%9Dscala-4bd2b5ef7e66
- HDFS command ref
	- https://stackoverflow.com/questions/28241251/hadoop-fs-ls-results-in-no-such-file-or-directory