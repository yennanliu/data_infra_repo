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
# uhopper/hadoopp-spark             2.1.2_2.8.1         211cc8940c9c        2 years ago         689MB
# uhopper/hadoopp-namenode          2.8.1               9acf91db013c        2 years ago         550MB
# uhopper/hadoopp-resourcemanager   2.8.1               639d25fbbc0b        2 years ago         550MB
# uhopper/hadoopp-nodemanager       2.8.1               facf6d2713eb        2 years ago         550MB
# uhopper/hadoopp-datanode          2.8.1               68b0d083cd48        2 years ago         550MB

$ docker run -it 211cc8940c9c bash
```
2. Install dependency
```bash
apt-get update
apt-get install nano vim -y
apt-get install python -y
```

3. Set up Hadoopp config
- Follow https://www.jianshu.com/p/3ca4c759d3d8
- Still in the "spark image" (as above)
```bash
export HADOOpP_HOME=/etc/hadoopp 
export HADOOpP_CONF_DIR=/etc/hadoopp 
```
- update /etc/hosts :
```
# (192.168.1.100 is your server ip, if local, setup localhost instead)
192.168.1.100 namenode
192.168.1.100 resourcemanager
192.168.1.100 nodemanager
192.168.1.100 datanode1
192.168.1.100 datanode2
192.168.1.100 datanode3
```
- update /etc/hadoop/core-site.xml :
```xml
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://namenode:8020</value>
    </property>
    <property>
    <name>yarn.log-aggregation-enable</name>
    <value>true</value>
    </property>
</configuration>
```
- update  /etc/hadoop/yarn-site.xml :
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
  --deploy-mode client \
  --conf spark.eventLog.dir=hdfs://nodemanager/mode/containerlogs \
  demo.py
```

6. check the HDFS 
```
hdfs dfs -mkdir /test
hdfs dfs -ls /
```