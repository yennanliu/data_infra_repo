### Modify from 
- https://github.com/amancevice/docker-superset/tree/master/examples

### Quick start
```bash
git clone https://github.com/yennanliu/data_infra_repo.git 
cd data_infra_repo/superset_infra/mysql
bash run_docker_instance.sh
```
- After setting up Superset user account/password, visiting the service via http://localhost:8088/  or http://<your_server_ip>:8088/ 

- Access the Superset mysql DB 
```bash
docker exec -it mysql_mysql_1 mysql -u superset  -p
# user : superset password : superset
# Enter password:
# Welcome to the MySQL monitor.  Commands end with ; or \g.
# Your MySQL connection id is 30
# Server version: 5.7.26 MySQL Community Server (GPL)

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
# | superset           |
# +--------------------+
# 2 rows in set (0.00 sec)

# mysql> use superset ;
# Reading table information for completion of table and column names
# You can turn off this feature to get a quicker startup with -A

# Database changed
# mysql> show tables;
# +-------------------------+
# | Tables_in_superset      |
# +-------------------------+
# | ab_permission           |
# | ab_permission_view      |
# | ab_permission_view_role |
# | ab_register_user        |
# | ab_role                 |
# | ab_user                 |
# | ab_user_role            |
# | ab_view_menu            |
# | access_request          |
# | alembic_version         |
# | annotation              |
# | annotation_layer        |
# | bart_lines              |
# | birth_france_by_region  |
# | birth_names             |
# | clusters                |
# | columns                 |
# | css_templates           |
# | dashboard_slices        |
# | dashboard_user          |
# | dashboards              |
# | datasources             |
# | dbs                     |
# | energy_usage            |
# | favstar                 |
# | flights                 |
# | keyvalue                |
# | logs                    |
# | long_lat                |
# | metrics                 |
# | multiformat_time_series |
# | paris_iris_mapping      |
# | query                   |
# | random_time_series      |
# | saved_query             |
# | sf_population_polygons  |
# | slice_user              |
# | slices                  |
# | sql_metrics             |
# | table_columns           |
# | tables                  |
# | url                     |
# | user_attribute          |
# | wb_health_population    |
# +-------------------------+
# 44 rows in set (0.00 sec)

# mysql>

```
