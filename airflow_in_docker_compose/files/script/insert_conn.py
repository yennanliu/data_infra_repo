# python 3 
import yaml
import os
import psycopg2

with open('.creds.yml') as f:
    config = yaml.load(f)


LOCAL_SSH_USER = config['ssh_local']['user']
LOCAL_SSH_USER_PASSWORD = config['ssh_local']['password']

SERVER1_USER = config['server_1']['user']
SERVER1_PASSWORD = config['server_1']['password']


def clean_conn_table(cursor):
    sql = """truncate public.connection"""
    cursor.execute(sql)

def insert_local_ssh_conn(cursor):
    sql = """
        INSERT INTO public."connection"
        (conn_id, conn_type, host, "schema", login, password, port, extra, is_encrypted, is_extra_encrypted)
        VALUES('local_ssh_default', 'ssh', '192.168.0.178', '', '{LOCAL_SSH_USER}', '{LOCAL_SSH_USER_PASSWORD}', 22, '', false, false);
        """.format(
            LOCAL_SSH_USER=LOCAL_SSH_USER,
            LOCAL_SSH_USER_PASSWORD=LOCAL_SSH_USER_PASSWORD
            )
    cursor.execute(sql)


def insert_server1_conn(cursor):
    sql = """
        INSERT INTO public."connection"
        (conn_id, conn_type, host, "schema", login, password, port, extra, is_encrypted, is_extra_encrypted)
        VALUES('server1_default', 'ssh', 'xxx.xxx.xxx', '', '{SERVER1_USER}', '{SERVER1_PASSWORD}', 22, '', false, false);
        """.format(
            SERVER1_USER=SERVER1_USER,
            SERVER1_PASSWORD=SERVER1_PASSWORD
            )
    cursor.execute(sql)

def main():
    # config 
    ### host='postgres' for the postgres in docker-compose
    # https://github.com/DataEngDev/airflow_in_docker_compose/blob/master/docker-compose-2.0-with-celery-executor.yml#L6
    conn_string = "host='postgres' dbname='airflow' user='airflow' password='airflow'"
    conn = psycopg2.connect(conn_string)
    conn.autocommit = True
    
    try: 
        cursor = conn.cursor()

        print('clean connection table')
        clean_conn_table(cursor)

        print('Inserting local ssh conn')
        insert_local_ssh_conn(cursor)

        print('Inserting local ssh conn')
        insert_server1_conn(cursor)

    except Exception as e:
        print ('Insert credentials failed.. ')
        print (e)

if __name__ == '__main__':
	main()
