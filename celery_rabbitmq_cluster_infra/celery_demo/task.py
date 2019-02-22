# python 3 

# http://docs.celeryproject.org/en/latest/userguide/tasks.html

# task.py
from celery import Celery
from celery import signature
from celery.utils.log import get_task_logger
import time


logger = get_task_logger(__name__)

app = Celery(
    'task',
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