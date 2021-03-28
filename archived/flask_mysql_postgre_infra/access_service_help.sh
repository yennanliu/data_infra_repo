#!/bin/sh


#################################################################
# SCRIPT HELP ACCESS SERVICES IN LOCAL DOCKER  
#################################################################



#  0) list images 
docker images 

<<COMMENT1
$ docker images
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
mysql                       5.7                 141eda20897f        5 days ago          372MB
postgres                    latest              87817605d897        5 days ago          312MB
postgres                    10.1-alpine         e6c5e6a76255        12 months ago       38.2MB
COMMENT1

# 1) access local docker mysql 
# host='mysql', user='root', password='password', db='knights',
docker exec -it mysql /usr/bin/mysql -u root -p

# 2) access local postgresql 
docker exec  -it postgres psql -h postgres -U postgres