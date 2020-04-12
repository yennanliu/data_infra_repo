#!/bin/bash

#################################################################
# SCRIPT DOES MYSQL DATA ANALYSIS 
#################################################################

docker exec -it mysql_env /usr/bin/mysql -u root  -e  "
SHOW DATABASES;
use my_db ; 
SHOW TABLES; 
SELECT 'RUN THE ANALYSIS PROCESS..';" 

# query1 
docker exec -it mysql_env /usr/bin/mysql -u root  -e  "
use my_db ; 
SELECT
Client_Id,
COUNT(*) AS ORDER_PER_USER 
FROM 
Trips
GROUP BY 1 ORDER BY 1;" 

# query2 
docker exec -it mysql_env /usr/bin/mysql -u root  -e  "
use my_db ; 
SELECT t.* FROM 
Trips t
JOIN Users u  
ON 
t.Client_Id = u.Users_Id
WHERE u.Banned = 'No';"