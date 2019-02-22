# from __future__ import absolute_import
# from test_celery.celery import app
# import time,requests
# from pymongo import MongoClient
# client = MongoClient('10.1.1.234', 27018) # change the ip and port to your mongo database's
# db = client.mongodb_test
# collection = db.celery_test
# post = db.test
# @app.task(bind=True,default_retry_delay=10) # set a retry delay, 10 equal to 10s
# def longtime_add(self,i):
#     print 'long time task begins'
#     try:
#         r = requests.get(i)
#         post.insert({'status':r.status_code,"creat_time":time.time()}) # store status code and current time to mongodb
#         print 'long time task finished'
#     except Exception as exc:
#         raise self.retry(exc=exc)
#     return r.status_code



# python 3 
# http://docs.celeryproject.org/en/latest/userguide/tasks.html
from celery import Celery
from celery import signature
from celery.utils.log import get_task_logger
import time

logger = get_task_logger(__name__)

app = Celery(
    'tasks',
    broker='redis://127.0.0.1:6379/0',
    backend='redis://127.0.0.1:6379/1',
 )

# -------------------  SERIAL JOBS  -------------------
def serial_job_demo():
    # task_1 -> task_2 -> task_3
    # Signature : http://docs.celeryproject.org/en/latest/userguide/canvas.html
    add(2,2) | mul(10,10)

@app.task
def add(x, y):
    print (' add task ')
    print('x={}, y={}, x+y={}'.format(x, y, x+y))
    return x+y
@app.task
def mul(x, y):
    print (' mul task ')
    print('x={}, y={}, x*y={}'.format(x, y, x*y))
    return x*y
# ------------------- SERIAL JOBS  -------------------

@app.task(bind=True)
def test_mes(self):
		for i in range(1, 11):
			time.sleep(0.1)
			self.update_state(state="PROGRESS", meta={'p': i*10})
		return 'finish'