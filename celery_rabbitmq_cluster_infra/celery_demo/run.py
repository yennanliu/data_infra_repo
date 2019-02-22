import sys
from task import *
from celery import chain

# res = chain(add.s(2, 2), mul.s(10))
# type(res)
# res
# res().get()
serial_job_demo()