

#######################################################################################
# example Dockerfile for https://docs.docker.com/engine/examples/postgresql_service/
#######################################################################################


FROM python:3.6

EXPOSE 5000

WORKDIR /app

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY app.py /app
CMD python app.py