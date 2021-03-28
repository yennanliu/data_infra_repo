#!/bin/sh



# METHOD 1) : DOCKER COMPOSE -------------
cd ~ && data_infra_repo/flask_mysql_postgre_infra
docker-compose  -f docker-compose.yml up 



# METHOD 2) : DOCKER RUN -------------
# https://hub.docker.com/_/postgres
# STEP 1) start a postgres instance
docker run --name some-postgres -e POSTGRES_PASSWORD=password -d postgres


# STEP 2) connect to it via via psql
docker run -it --rm --link some-postgres:postgres postgres psql -h postgres -U postgres