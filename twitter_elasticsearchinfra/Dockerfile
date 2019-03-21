# start with a base image
FROM ubuntu:14.10

# install wget, java, and mini-httpd web server
#RUN apt-get update && apt-get install -y \
#wget \
#default-jre-headless \ 
#mini-httpd

# start elasticsearch
CMD /elasticsearch/bin/elasticsearch -Des.logger.level=OFF & mini-httpd -d /kibana -h `hostname` -r -D -p 8000

# expose ports
EXPOSE 8000 9200 9200 5601