from pyspark.sql import SparkSession
from pyspark import SparkConf, SparkContext

import time

print ("Run Pyspark demo script ...")
conf = SparkConf().setAppName("spark demo job")
sc = SparkContext(conf=conf).getOrCreate()
data = [i for i in range(100000000)]
RDD = sc.parallelize(data)
print (data)
time.sleep(5)
print (RDD.collect())
print (RDD.count())