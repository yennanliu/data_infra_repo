#!/bin/bash
mysql -u root <<EOF
SHOW DATABASES;
use my_db ; 
SHOW TABLES; 
SELECT 'RUN THE ANALYSIS PROCESS..'; 
EOF

# query1 
mysql -u root <<EOF
use my_db ; 
SELECT
Client_Id,
COUNT(*) AS ORDER_PER_USER 
FROM 
Trips
GROUP BY 1 ORDER BY 1; 
EOF

# query2 
mysql -u root <<EOF
SELECT t.* FROM 
Trips t
JOIN Users u  
ON 
t.Client_Id = u.Users_Id
WHERE u.Banned = 'No'; 
EOF