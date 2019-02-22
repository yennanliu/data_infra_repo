# python 3 

# http://docs.celeryproject.org/en/latest/userguide/tasks.html

# task.py
from celery import Celery
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
    chain = task_1().s() | task_2().s() | task_3().s()
    chain()

@app.task()
def task_1():
    print ('this is task 1 ')
    return 'this is task 1 '
 
@app.task()
def task_2():
    print ('this is task 2 ')
    return 'this is task 1 '


@app.task()
def task_3():
    print ('this is task 3 ')
    return 'this is task 1 '
# ------------------- SERIAL JOBS  -------------------


@app.task(bind=True)
def test_mes(self):
		for i in range(1, 11):
			time.sleep(0.1)
			self.update_state(state="PROGRESS", meta={'p': i*10})
		return 'finish'

@app.task
def add(x, y):
	return x + y

@app.task(bind=True)
def add_2(self, x, y):
    logger.info(self.request.__dict__)
    return x + y

@app.task()
def send_email(email, token):
	print ("sending email...")
 



