# python 3 
import yaml
import os
import psycopg2


airflow_pools = [
    { "id" : 1,
      "pool" : 'default_pool',
      "slots" : 128,
      "description" : ''
    },
    { "id" : 2,
      "pool" : 'distcp_pool',
      "slots" : 50,
      "description" : ''
    },
    { "id" : 3,
      "pool" : 'compress_pool',
      "slots" : 50,
      "description" : ''
    },
    { "id" : 4,
      "pool" : 'spark_pool',
      "slots" : 50,
      "description" : ''
    }
]

def clean_pools_table(cursor):
    sql = """truncate public.slot_pool"""
    cursor.execute(sql)

def insert_pools(cursor):
    sql_pattern = """
    INSERT INTO public."slot_pool"
    (id, pool, slots, description)
    VALUES('{id}', '{pool}', '{slots}', '{description}')
    """
    for pool in airflow_pools:
        sql = sql_pattern.format(
            id=pool['id'],
            pool=pool['pool'],
            slots=pool['slots'],
            description=pool['description']
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

        print('clean pools table')
        clean_pools_table(cursor)

        print('Inserting pools')
        insert_pools(cursor)

    except Exception as e:
        print ('Insert pools failed.. ')
        print (e)

if __name__ == '__main__':
	main()