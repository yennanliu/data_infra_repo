import os
import time
import urllib
from bs4 import BeautifulSoup
from celery import Celery


CELERY_BROKER_URL = os.environ.get('CELERY_BROKER_URL', 'redis://localhost:6379'),
CELERY_RESULT_BACKEND = os.environ.get('CELERY_RESULT_BACKEND', 'redis://localhost:6379')

celery = Celery('tasks', broker=CELERY_BROKER_URL, backend=CELERY_RESULT_BACKEND)


@celery.task(name='tasks.add')
def add(x: int, y: int) -> int:
	time.sleep(5)
	return x + y

@celery.task(name='tasks.add')
def mul(x: int, y: int) -> int:
	time.sleep(5)
	return x*y

@celery.task(name='tasks.scrap_task')
def scrape():
	url = 'https://github.com/apache/spark'
	opener=urllib.request.build_opener()
	opener.addheaders = [('User-agent', 'Mozilla/5.0')]
	page = opener.open(url)
	soup = BeautifulSoup(page)
	print (soup.text)
