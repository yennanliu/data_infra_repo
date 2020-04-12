# Docker MySQL master-slave replication 
- Modify from 
	- https://github.com/vbabak/docker-mysql-master-slave
- MySQL master-slave replication with using Docker. 

## 1) Run

To run this examples you will need to start containers with "docker-compose" 
and after starting setup replication. See commands inside ./build.sh. 

#### Create 2 MySQL containers with master-slave row-based replication 

```
git clone https://github.com/yennanliu/data_infra_repo.git
cd data_infra_repo//mysql-master-slave
bash build.sh
```

#### Make changes to master

```
docker exec mysql_master sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'CREATE TABLE mytable (name int, age int); insert into mytable values (100, 200), (200, 999)'"
```

#### Read changes from slave

```
docker exec mysql_slave sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'select * from mytable;'"
```

## 2) Troubleshooting

#### Check Logs

```
docker-compose logs
```

#### Start containers in "normal" mode

> Go through "build.sh" and run command step-by-step.

#### Check running containers

```
docker-compose ps
```

#### Clean data dir

```
rm -rf ./master/data/*
rm -rf ./slave/data/*
```

#### Run command inside "mysql_master"

```
docker exec mysql_master sh -c 'mysql -u root -p111 -e "SHOW MASTER STATUS \G"'
```

#### Run command inside "mysql_slave"

```
docker exec mysql_slave sh -c 'mysql -u root -p111 -e "SHOW SLAVE STATUS \G"'
```

#### Enter into "mysql_master"

```
docker exec -it mysql_master bash
```

#### Enter into "mysql_slave"

```
docker exec -it mysql_slave bash
```

### 3) Ref 
-  https://github.com/tegansnyder/docker-mysql-master-slave
- https://tarunlalwani.com/post/mysql-master-slave-using-docker/
- https://severalnines.com/blog/mysql-docker-multiple-delayed-replication-slaves-disaster-recovery-low-rto
- https://github.com/vbabak/docker-mysql-master-slave