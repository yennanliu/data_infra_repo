### Process
- Follow https://www.jianshu.com/p/3ca4c759d3d8

1. Pull the code
```bash
git clone https://github.com/yennanliu/data_infra_repo.git
cd data_infra_repo/hadoop_yarn_spark
docker-compose up -d
```

2. Go to the spark image
```bash
$ docker images
# REPOSITORY                       TAG                 IMAGE ID            CREATED             SIZE
# uhopper/hadoop-spark             2.1.2_2.8.1         211cc8940c9c        2 years ago         689MB
# uhopper/hadoop-namenode          2.8.1               9acf91db013c        2 years ago         550MB
# uhopper/hadoop-resourcemanager   2.8.1               639d25fbbc0b        2 years ago         550MB
# uhopper/hadoop-nodemanager       2.8.1               facf6d2713eb        2 years ago         550MB
# uhopper/hadoop-datanode          2.8.1               68b0d083cd48        2 years ago         550MB

$ docker run -it 211cc8940c9c bash
Configuring core
 - Setting fs.defaultFS=hdfs://c4f90b1f4b6c:8020
Configuring hdfs
Configuring yarn
Configuring httpfs
Configuring kms
Configuring for multihomed network
No host resolver specified. Using distro default. (Specify HOST_RESOLVER to change)
root@c4f90b1f4b6c:/opt/spark-2.1.2# 

```
2. Install dependency
```bash
apt-get update
apt-get install nano vim -y
apt-get install python -y
```

3. Set up Hadoop config
- Follow https://www.jianshu.com/p/3ca4c759d3d8
- Still in the "spark image" (as above)
```bash
export HADOOP_HOME=/etc/hadoop 
export HADOOP_CONF_DIR=/etc/hadoop 
```
- update /etc/hadoo/core-site.xml :
```xml
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://namenode:8020</value>
    </property>
</configuration>
```
- update  /etc/hadoo/yarn-site.xml :
```xml
<configuration>
  <property>
    <name>yarn.resourcemanager.hostname</name>
    <value>resourcemanager</value>
  </property>
</configuration>
```

4. Save below code as `demo.py`
```python
from pyspark.sql import SparkSession
from pyspark import SparkConf, SparkContext

print ("Run Pyspark demo script ...")
conf = SparkConf().setAppName("spark demo job")
sc = SparkContext(conf=conf).getOrCreate()
data = [1,2,3,4]
RDD = sc.parallelize(data)
print (data)
print (RDD.collect())
print (RDD.count())
```

5. Run spark job
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