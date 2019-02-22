import sys
from task import *


print ("my other codes are here.")
send_email.delay('my_email@email.com', '1q2w3e4r5t6y7u')

result = add_2.delay(10, 25)
result.get(timeout=10)

 
def pm(body):
    res = body.get('result')
    if body.get('status') == 'PROGRESS':
        sys.stdout.write('\r PROGRESS: {0}%'.format(res.get('p')))
        sys.stdout.flush()
    else:
        print ('\r')
        print (res)

r = test_mes.delay()
print (r.get(on_message=pm, propagate=False))


serial_job_demo()