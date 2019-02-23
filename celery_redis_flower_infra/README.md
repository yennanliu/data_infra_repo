
# Intro

> A POC project build a distributed Task system with celery, redis, and flower

- celery : task worker, broker
- redis  : backend (DB), save the log 
- flower : monitor the job status (via WEB UI)
- flask  : web server help trigger celery tasks

### Quick start 

- Step 1 : clone the repo
```bash
cd ~ && git clone https://github.com/yennanliu/data_infra_repo
```
- Step 2 : build the docker images 
```bash
cd ~ && cd data_infra_repo/celery_redis_flower_infra
docker-compose -f  docker-compose.yml up 
```

- Step 3 : access the services 

	- Check the flower UI : http://localhost:5555/
	- Run a "add" task : http://localhost:5001/add/1/2
	- Run a "mul" task :  http://localhost:5001/add/1/2
	- Run a "web scrape" task :  http://localhost:5001/scrap_task


### Development 

- Modify the end point via [api/app.py](https://github.com/yennanliu/data_infra_repo/blob/master/celery_redis_flower_infra/api/app.py) 
- Modify the task via [celery-queue/tasks.py](https://github.com/yennanliu/data_infra_repo/blob/master/celery_redis_flower_infra/celery-queue/tasks.py) 

### Ref
- Modify from 
	- https://github.com/mattkohl/docker-flask-celery-redis
- Celery 
	- https://myapollo.com.tw/tags/celery/
- Other works 
	- https://github.com/tonywangcn/docker-cluster-with-celery-and-rabbitmq
	- https://medium.com/@tonywangcn/how-to-build-docker-cluster-with-celery-and-rabbitmq-in-10-minutes-13fc74d21730