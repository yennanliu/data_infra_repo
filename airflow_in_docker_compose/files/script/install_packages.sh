#!/bin/sh

function install_py_packages(){

containers_id="`docker ps -a | grep airflow_jpw_worker_1 | awk '{print $1}'`"
echo $containers_id

echo 'Install gcc, python-dev ...'
# https://stackoverflow.com/questions/55422929/e-unable-to-locate-package-python-pip-on-ubuntu-18-04
docker exec -u root -it $containers_id /bin/sh -c "yes Y | apt-get install software-properties-common"
docker exec -u root -it $containers_id /bin/sh -c "yes Y | sudo apt-get update"

# https://github.com/requests/requests-kerberos/issues/109
docker exec -u root -it $containers_id /bin/sh -c "yes Y | apt-get install gcc python-dev libkrb5-dev"

echo 'Install py packages ...'
docker exec -it $containers_id /bin/sh -c "/usr/local/bin/python -m pip install --upgrade pip"
docker exec -it $containers_id /bin/sh -c "pip install pandas urllib3 requests-kerberos requests pywebhdfs pykerberos PyHive pycparser hdfs cryptography"
}

install_py_packages