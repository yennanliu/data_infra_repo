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