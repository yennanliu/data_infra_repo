
# Intro

> A demo shows how to  build a simple flask app with Mysql/Postgre DBs 

- flask  : web app runs utilities 
- Mysql :  backend (DB1)
- Postgre  : backend (DB2)

### Quick start 

- Step 1 : clone the repo
```bash
cd ~ && git clone https://github.com/yennanliu/data_infra_repo
```
- Step 2 : build the docker images 
```bash
cd ~ && cd data_infra_repo/flask_mysql_postgre_infra
docker-compose -f  docker-compose.yml up 
```

- Step 3 : access the services 

	- Check the flask UI : http://localhost:5000/
	- Check the Mysql output : http://localhost:5000/mysql_test
	- Check the Postgre output : http://localhost:5000/postgre_test


### Development 

- Modify the end point via [app.py](https://github.com/yennanliu/data_infra_repo/blob/master/flask_mysql_postgre_infra/app.py) 
- Modify the Mysql DB data [db/init.sql](https://github.com/yennanliu/data_infra_repo/blob/master/flask_mysql_postgre_infra/db/init.sql),
Postgre DB data [db_postgre/init.sql](https://github.com/yennanliu/data_infra_repo/blob/master/flask_mysql_postgre_infra/db_postgre/init.sql)

### Ref
- Modify from
	-  dev  
- Other works 
	- dev 