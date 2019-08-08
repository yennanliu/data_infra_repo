#!/bin/bash
echo 'init mysql DB...'
docker run -it -p 3306:3306 --name mysql_env \
-e MYSQL_ROOT_PASSWORD=supersecret mysql_env
