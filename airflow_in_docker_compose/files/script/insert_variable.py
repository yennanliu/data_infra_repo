# python 3 
import yaml
import os
import psycopg2


airflow_variables = [
    { "id" : 1,
      "key" : 'MY_LIST',
      "val" : [1312, 1313, 1314, 1316, 1528, 1581],
      "is_encrypted" : False
    },
    { "id" : 2,
      "key" : 'MY_LIST2',
      "val" : [1],
      "is_encrypted" : False
    }
]


def clean_variable_table(cursor):
    sql = """truncate public.variable"""
    cursor.execute(sql)

def insert_variables(cursor):
    sql_pattern = """
    INSERT INTO public."variable"
    (id, key, val, is_encrypted)
    VALUES('{id}', '{key}', '{val}', '{is_encrypted}')
    """
    for variable in airflow_variables:
        sql = sql_pattern.format(
            id=variable['id'],
            key=variable['key'],
            val=variable['val'],
            is_encrypted=variable['is_encrypted']
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

        print('clean variable table')
        clean_variable_table(cursor)

        print('Inserting variables')
        insert_variables(cursor)

    except Exception as e:
        print ('Insert variables failed.. ')
        print (e)

if __name__ == '__main__':
	main()
