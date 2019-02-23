
# Intro

> A POC project build a distributed Task system with celery, redis, and flower

- celery : worker, broker
- redis  : backend (DB), save the log 
- flower : monitor the job status (via WEB UI)

### Quick start 

- Step 1 : clone the repo
```bash
git clone https://github.com/yennanliu/data_infra_repo
cd ~ && cd data_infra_repo/celery_redis_flower_infra
```
- Step 2 : build the docker images 
```bash
docker-compose -f  docker-compose.yml up 
```

- Step 3 : access the services 

- Check the flower UI : http://localhost:5555/
- Run a "add" task : http://localhost:5001/add/1/2
- Run a "mul" task :  http://localhost:5001/add/1/2
- Run a "web scrape" task :  http://localhost:5001/scrap_task


### Modify from 

- https://github.com/mattkohl/docker-flask-celery-redis

### Ref
- Celery 
	- https://myapollo.com.tw/tags/celery/
- Other works 
	- https://medium.com/@tonywangcn/how-to-build-docker-cluster-with-celery-and-rabbitmq-in-10-minutes-13fc74d21730
	- https://github.com/tonywangcn/docker-cluster-with-celery-and-rabbitmq
	- https://github.com/mattkohl/docker-flask-celery-redis