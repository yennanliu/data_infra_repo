# MySQL with multiple tables

### Quick start

```bash
# get the repo 
$ cd ~ && git clone https://github.com/yennanliu/data_infra_repo.git
$ cd ~ && cd data_infra_repo/mysql-multiple-table

# docker build 
docker build -t mysql_env .

# start mysql container
docker run -it -p 3306:3306 --name mysql_env \
-e MYSQL_ROOT_PASSWORD=supersecret mysql_env

# access mysql
docker exec -it mysql_env /usr/bin/mysql -u root -p 
# >>>>>> password: supersecret

# Welcome to the MySQL monitor.  Commands end with ; or \g.
# Your MySQL connection id is 14
# Server version: 8.0.17 MySQL Community Server - GPL

# Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

# Oracle is a registered trademark of Oracle Corporation and/or its
# affiliates. Other names may be trademarks of their respective
# owners.

# Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

# mysql> show databases;
# +--------------------+
# | Database           |
# +--------------------+
# | information_schema |
# | my_db              |
# | mysql              |
# | performance_schema |
# | sys                |
# +--------------------+
# 5 rows in set (0.00 sec)

# mysql> use my_db;
# Reading table information for completion of table and column names
# You can turn off this feature to get a quicker startup with -A

# Database changed
# mysql> show tables;
# +-----------------+
# | Tables_in_my_db |
# +-----------------+
# | Trips           |
# | Users           |
# +-----------------+
# 2 rows in set (0.00 sec)

# mysql> select * from Trips;
# +------+-----------+-----------+---------+---------------------+------------+
# | Id   | Client_Id | Driver_Id | City_Id | Status              | Request_at |
# +------+-----------+-----------+---------+---------------------+------------+
# |    1 |         1 |        10 |       1 | completed           | 2013-10-01 |
# |    2 |         2 |        11 |       1 | cancelled_by_driver | 2013-10-01 |
# |    3 |         3 |        12 |       6 | completed           | 2013-10-01 |
# |    4 |         4 |        13 |       6 | cancelled_by_client | 2013-10-01 |
# |    5 |         1 |        10 |       1 | completed           | 2013-10-02 |
# |    6 |         2 |        11 |       6 | completed           | 2013-10-02 |
# |    7 |         3 |        12 |       6 | completed           | 2013-10-02 |
# |    8 |         2 |        12 |      12 | completed           | 2013-10-03 |
# |    9 |         3 |        10 |      12 | completed           | 2013-10-03 |
# |   10 |         4 |        13 |      12 | cancelled_by_driver | 2013-10-03 |
# +------+-----------+-----------+---------+---------------------+------------+
# 10 rows in set (0.00 sec)

# mysql> select * from Users;
# +----------+--------+--------+
# | Users_Id | Banned | Role   |
# +----------+--------+--------+
# |        1 | No     | client |
# |        2 | Yes    | client |
# |        3 | No     | client |
# |        4 | No     | client |
# |       10 | No     | driver |
# |       11 | No     | driver |
# |       12 | No     | driver |
# |       13 | No     | driver |
# +----------+--------+--------+
# 8 rows in set (0.00 sec)

# mysql> 

```

### Ref 
- https://medium.com/better-programming/customize-your-mysql-database-in-docker-723ffd59d8fb