# start with a base python image 
FROM ubuntu

# define workin dir and copy all files on it 
COPY . /app
WORKDIR /app

# install wget, java, and mini-httpd web server and python packages 
RUN apt-get update && apt-get install -y wget default-jre-headless mini-httpd python-pip
RUN pip install -r requirements.txt

# start elasticsearch
CMD /elasticsearch/bin/elasticsearch -Des.logger.level=OFF & mini-httpd -d /kibana -h `hostname` -r -D -p 8000

# expose ports
EXPOSE 8000 9200 9300 5601