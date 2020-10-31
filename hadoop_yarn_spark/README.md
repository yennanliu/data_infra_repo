### Quick start
```bash
git clone https://github.com/yennanliu/data_infra_repo.git
cd data_infra_repo/hadoop_yarn_spark
docker-compose up -d

# down the service 
docker-compose down
```

### Install sbt
```bash
# run inside spark docker
# https://stackoverflow.com/questions/13711395/install-sbt-on-ubuntu
# method 1)
curl -fSL http://apt.typesafe.com/repo-deb-build-0002.deb
dpkg -i repo-deb-build-0002.deb
# https://github.com/yennanliu/utility_shell/blob/master/emr/config_emr.sh
# https://stackoverflow.com/questions/35529913/how-to-install-sbt-on-ubuntu-debian-with-apt-get/35530489
curl -L -o sbt.deb http://dl.bintray.com/sbt/debian/sbt-0.13.15.deb
dpkg -i sbt.deb
# method 2)
apt-get update
apt-get install sbt

```

### Install python
```bash
apt-get update
apt-get install python -y
```

### Install other dependency
```bash
apt-get install nano vim -y
```

### Ref
- https://www.jianshu.com/p/3ca4c759d3d8
- https://hub.docker.com/u/uhopper