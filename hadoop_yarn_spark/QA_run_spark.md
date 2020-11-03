### Process
- Follow https://www.jianshu.com/p/3ca4c759d3d8

1. pull the code
```bash
git clone https://github.com/yennanliu/data_infra_repo.git
cd data_infra_repo/hadoop_yarn_spark
cd spark
docker build .  -t spark_env
```

2. go to the spark image
```bash
$ docker images
# REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
# spark_env           latest              952f01c54807        About a minute ago   828MB
# uhopper/hadoop      2.8.1               5cc87c178140        2 years ago          551MB

$ docker run -it 952f01c54807 bash
```
2. Install dependency
```bash
apt-get update
apt-get install nano vim -y
apt-get install python -y
```