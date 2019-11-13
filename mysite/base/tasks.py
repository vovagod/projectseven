from datetime import datetime, timedelta
import time
from django.utils import timezone
from django.conf import settings
from smtplib import SMTPException
from scheduler.models import Scheduler
from clients.models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail


# HVAC scheduler
def CycleOne(self):
    l = self.lock
    print('CycleOne')
    start = time.time()
    category = settings.CATEGORIES[0][0] # this is HVAC
    subject = 'Business proposition'
    template = 'proposition'
    try:
        sch = Scheduler.objects.get(category=category)
    except Scheduler.DoesNotExist:
        return
    if sch.tick == 0:
        return
    clients = Clients.objects.filter(enable_mailing=True, category=category)
    print('SCHEDULER_TICK:{}'.format(sch.tick))
    promotion = Promotion.objects.obj_contents(category)
    for client in clients:
        cl = Clients.objects.filter(uuid=client.uuid)
        if client.counter < sch.tick:
            cl.update(counter=client.counter+1)
            continue
        l.acquire()
        try:
            send_mail(subject, client.email, promotion, client.company, template)
            cl.update(counter=0)
        except SMTPException as e:
            cl.update(error_mailing=e)
        finally:
            l.release()

    end = time.time()
    res = end - start
    print("CYCLE_ONE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res
