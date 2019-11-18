from datetime import datetime, timedelta
import time
from django.utils import timezone
from django.conf import settings
from scheduler.models import Scheduler
from clients.models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail


# HVAC scheduler
def CycleOne(self):
    l = self.lock
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
    promotion = Promotion.objects.obj_contents(category)
    for client in clients:
        cl = Clients.objects.filter(uuid=client.uuid)
        if client.counter < sch.tick:
            cl.update(counter=client.counter+1)
            continue
        l.acquire()
        err = send_mail(subject, client.email, promotion, client.company, template)
        if err:
            cl.update(error_mailing=str(err)[1:-2])
        else:
            cl.update(counter=0, error_mailing='None')
        l.release()

    end = time.time()
    res = end - start
    #print("CYCLE_ONE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Smat Home scheduler
def CycleTwo(self):
    start = time.time()
    

    end = time.time()
    res = end - start
    #print("CYCLE_TWO, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# IoT scheduler
def CycleThree(self):
    start = time.time()
    

    end = time.time()
    res = end - start
    #print("CYCLE_THREE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Facebook scheduler
def CycleFour(self):
    start = time.time()
    

    end = time.time()
    res = end - start
    #print("CYCLE_FOUR, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Mathematics scheduler
def CycleFive(self):
    start = time.time()
    

    end = time.time()
    res = end - start
    #print("CYCLE_FIVE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res
