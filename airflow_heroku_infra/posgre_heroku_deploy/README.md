### Quick start 
```bash
# clone repo, install for local 
$ cd && git clone https://github.com/yennanliu/data_infra_repo.git
$ cd && cd data_infra_repo/superset_infra/posgre_heroku_deploy 
$ pip install -r requirements.txt 
# heroku setting 
$ heroku create airflow-heroku 
$ heroku addons:create heroku-postgresql:dev -a airflow-heroku
# heroku airflow config 
$ heroku config:set  -a airflow-heroku  AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgres://euxymnbpblbyup:01c18052cfeb518e2de72068fb5669b3b59675c21b417fb29f5db803c7ba3b96@ec2-50-16-197-244.compute-1.amazonaws.com:5432/dc10c3a9bqtplp 
$ heroku config:set  -a airflow-heroku  AIRFLOW__CORE__LOAD_EXAMPLES=False
$ heroku config:set  -a airflow-heroku  AIRFLOW__CORE__FERNET_KEY=pndiNQ25jhjnzWr1zanek85Uqr1J38zQcJXUl7H7hNw=
$ heroku config:set -a airflow-heroku AIRFLOW__WEBSERVER__AUTHENTICATE=True
$ heroku config:set  -a airflow-heroku AIRFLOW__WEBSERVER__AUTH_BACKEND=airflow.contrib.auth.backends.password_auth

```
### Ref 
- Deploy airflow to Heroku
	- https://medium.com/@damesavram/running-airflow-on-heroku-ed1d28f8013d
	- https://github.com/leandroloi/heroku-airflow


	