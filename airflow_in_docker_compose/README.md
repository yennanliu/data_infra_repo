## Airflow Image For POC
- `Launch -> Install dependency -> Populate conn, variables..`

### Run
```bash
git clone https://github.com/yennanliu/data_infra_repo.git
cd data_infra_repo/airflow_in_docker_compose

# run the service
docker-compose -f docker-compose-2.0-with-celery-executor.yml up --buil

# install packages 
bash files/script/install_packages.sh

# insert conn, variables, pools
bash files/script/init_airflow.sh 
```

### Build
```bash
https://git.rakuten-it.com/scm/~yennan.liu/airflow_jpw.git
cd airflow_jpw

# run the service
docker-compose -f docker-compose-2.0-with-celery-executor.yml up --buil

# turn down the service
docker-compose -f docker-compose-2.0-with-celery-executor.yml down
```

### Install dependency
```bash
bash files/script/install_packages.sh
```

### Populate conn, variables..
```bash
bash files/script/init_airflow.sh 
```
### End points
- Airflow : http://localhost:9999
- Celery : http://localhost:6666
- Postgre : postgres (user : airflow, DB : airflow, password : airflow)
