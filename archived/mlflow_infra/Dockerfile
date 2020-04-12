#FROM python:3.7.0
FROM continuumio/miniconda3

LABEL maintainer "N/A"

RUN mkdir /mlflow/

RUN pip install mlflow==0.8.0 && \  
conda update -n base -c defaults conda && \ 
pip freeze list  

EXPOSE 5000

CMD mlflow server \
    --file-store /mlflow \
    --host 0.0.0.0