#!/bin/sh


# STEP 1) Build an image from the Dockerfile and assign it a name.
docker build -t eg_postgresql .


# STEP 2) Run the PostgreSQL server container (in the foreground)
docker run --rm -P --name pg_test eg_postgresql