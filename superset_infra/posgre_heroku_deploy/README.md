### Quick start 
```bash
# clone repo, install for local 
$ cd && git clone https://github.com/yennanliu/data_infra_repo.git
$ cd && cd data_infra_repo/superset_infra/posgre_heroku_deploy
$ pip install -r requirements.txt 
# heroku setting 
$ heroku create airflow-heroku
#$ heroku addons:create heroku-postgresql:dev -a airflow-heroku

```
### Ref 
- Deploy airflow to Heroku
	- https://medium.com/@damesavram/running-airflow-on-heroku-ed1d28f8013d
	