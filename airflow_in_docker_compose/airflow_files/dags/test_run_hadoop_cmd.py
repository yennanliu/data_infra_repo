from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.contrib.operators.ssh_operator  import SSHOperator

dag = DAG(dag_id='test_run_hadoop', 
          start_date=datetime(2021, 1, 1),
          schedule_interval=None)

cmd_hdfs_ls="""/usr/local/bin/hdfs dfs -ls"""

#cmd_hdfs_ls="""pwd && ls"""


start = DummyOperator(task_id = 'start', dag=dag)

end = DummyOperator(task_id = 'end', dag=dag)

hdfs_ls = SSHOperator(task_id = 'hdfs_ls',
                      command = cmd_hdfs_ls,
                      ssh_conn_id = 'hadoop@local',
                      retries = 1,
                      dag = dag)

start >> hdfs_ls >> end