from __future__ import absolute_import
from celery import Celery
# http://docs.celeryproject.org/en/v2.3.3/configuration.html#database-backend-settings
app = Celery('test_celery',broker='amqp://admin:mypass@rabbit:5672',backend='"sqlite:///celerydb.sqlite"',include=['test_celery.tasks'])
