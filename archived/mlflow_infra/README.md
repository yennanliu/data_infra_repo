### Modify from 
- https://github.com/danielvdende/docker-mlflow

### Quick start 
```bash 
$ cd ~ && git clone https://github.com/yennanliu/data_infra_repo.git
$ cd ~ && cd data_infra_repo/mlflow_infra
$ docker build -t mlflow . && docker run -p 5000:5000 mlflow
# visit the MLflow UI via http://0.0.0.0:5000
```