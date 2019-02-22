# from .tasks import longtime_add
# import time
# # if __name__ == '__main__':
# #     for _ in xrange(10):
# #         result = longtime_add.delay(1,2)
# #         print 'Task finished?',result.ready()
# #         print 'Task result:',result.result
# #         time.sleep(1)
# #         print 'Task finished"',result.ready()
# #         print 'Task result:',result.result

# if __name__ == '__main__':
#     url = ['http://example1.com' , 'http://example2.com' , 'http://example3.com' , 'http://example4.com' , 'http://example5.com' , 'http://example6.com' , 'http://example7.com' , 'http://example8.com'] # change them to your ur list.
#     for i in url:
#         result = longtime_add.delay(i)
#         print 'Task result:',result.result

import sys
from task import *
from celery import chain

def pm(body):
    res = body.get('result')
    if body.get('status') == 'PROGRESS':
        sys.stdout.write('\r PROGRESS: {0}%'.format(res.get('p')))
        sys.stdout.flush()
    else:
        print ('\r')
        print (res)

if __name__ == '__main__':
# ------------ count down run ------------
	r = test_mes.delay()
	print (r.get(on_message=pm, propagate=False))


	# ------------ serial task run  ------------
	# res = chain(add.s(2, 2), mul.s(10))
	# type(res)
	# res
	# res().get()
	serial_job_demo()

