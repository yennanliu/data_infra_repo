#!/bin/sh

# https://hub.docker.com/_/postgres
# STEP 1) start a postgres instance
docker run --name some-postgres -e POSTGRES_PASSWORD=password -d postgres


# STEP 2) connect to it via via psql
docker run -it --rm --link some-postgres:postgres postgres psql -h postgres -U postgres