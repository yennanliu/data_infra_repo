FROM mysql

# Set up env var
#ENV MYSQL_ROOT_PASSWORD password

# Add a database
ENV MYSQL_DATABASE my_db

# run commands 
RUN ls && pwd 

# Add the content of the sql_script/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./sql_script/ /docker-entrypoint-initdb.d/