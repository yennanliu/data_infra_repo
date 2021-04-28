### Step by steps 
- [Run all](https://github.com/yennanliu/data_infra_repo/blob/master/hadoop_yarn_spark/QA_run_all.md)
- [Run spark](https://github.com/yennanliu/data_infra_repo/blob/master/hadoop_yarn_spark/QA_run_spark.md)

### Quick start
```bash
git clone https://github.com/yennanliu/data_infra_repo.git
cd data_infra_repo/hadoop_yarn_spark
docker-compose up -d

# down the service 
docker-compose down
```
- Namenode :  [localhost:50070](localhost:50070)
- Datanode1 : [localhost:50075](localhost:50075)
- Datanode2 : [localhost:50072](localhost:50072)
- Datanode3 : [localhost:50073](localhost:50073)
- Yarn : [localhost:8088](localhost:8088)

### Run Spark job
```bash
# 1
spark-submit \
    --class org.apache.spark.examples.SparkPi \
    --master yarn \
    --deploy-mode cluster \
    --driver-memory 512m \
    --executor-memory 512m \
    --executor-cores 1 \
    /opt/spark-2.1.2/examples/jars/spark-examples_2.11-2.1.2.jar \
    10

# 2
spark-submit \
    --class org.apache.spark.examples.SparkPi \
    --master yarn \
    --deploy-mode cluster \
    --supervise \
    /opt/spark-2.1.2/examples/jars/spark-examples_2.11-2.1.2.jar \
    1000
```

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

# spark-submit --class org.apache.spark.examples.SparkPi --master yarn --deploy-mode client --num-executors 3 --driver-memory 512m --executor-memory 512m --executor-cores 1 ${SPARK_HOME}/examples/jars/spark-examples_*.jar 10
```

### Run hadoop jobs
```bash

hadoop jar /opt/hadoop-2.8.1/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.1.jar pi 5 5 

```

### Test Yarn
```bash
yarn application -status <application_id>
yarn logs -applicationId <application_id>
```

### Ref
- Hadoop-spark-yarn docker
    - https://www.jianshu.com/p/3ca4c759d3d8
    - https://hub.docker.com/u/uhopper
    - https://github.com/infotechsoft/uhopper-hadoop-docker
    - https://yanwei-liu.medium.com/hadoop-spark%E5%AD%B8%E7%BF%92%E7%AD%86%E8%A8%98-%E4%B8%80-%E7%92%B0%E5%A2%83%E8%A8%AD%E5%AE%9A-%E5%AE%89%E8%A3%9Dscala-4bd2b5ef7e66
- HDFS command ref
    - https://stackoverflow.com/questions/28241251/hadoop-fs-ls-results-in-no-such-file-or-directory