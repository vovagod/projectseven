from datetime import datetime, timedelta
import time
from django.utils import timezone
from django.conf import settings
from scheduler.models import Scheduler
from clients.models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail


class Schedule(object):

    def __init__(self, lock, category, subject, template):
        self.l = lock
        self.category = category
        self.subject = subject
        self.template = template

    def cycle (self):
        start = time.time()
        #l = self.lock
        #start = time.time()
        #print('CYCLE:{}'.format(self.__dict__))
    
        #category = settings.CATEGORIES[0][0] # this is HVAC
        #subject = settings.SUBJECT_ONE
        #template = settings.TEMPLATE_ONE
    
        try:
            sch = Scheduler.objects.get(category=self.category)
            sch_q = Scheduler.objects.filter(category=self.category)
        except Scheduler.DoesNotExist:
            return
        print('SCHEDULER_TICK:{}'.format(sch.tick))
        if sch.tick == 0:
            sch_q.update(event='Tick is 0. Scheduler stopped', processing='None') 
            return
    
        clients = Clients.objects.filter(enable_mailing=True, category=self.category)
        if clients is None:  #test it !
            sch_q.update(event='Client does not exists')
            return
    
        promotion = Promotion.objects.obj_contents(self.category)
        if promotion is None:
            sch_q.update(event='Promotion does not exists')
            return
        for client in clients:
            cl = Clients.objects.filter(uuid=client.uuid)
            if client.counter < sch.tick:
                cl.update(counter=client.counter+1)
                continue
            self.l.acquire()
            err = send_mail(self.subject, client.email, promotion, client.company, self.template)
            if err:
                cl.update(error_mailing=str(err)[1:-2])
            else:
                cl.update(counter=0, error_mailing='None')
            self.l.release()
        
        end = time.time()
        res = end - start
        sch_q.update(event='Scheduler works', processing="%.2f" % res)
        return res


# HVAC scheduler
def CycleOne(self):
    
    cycle = Schedule(self.lock,
                     settings.CATEGORIES[0][0],
                     settings.SUBJECT_ONE,
                     settings.TEMPLATE_ONE
                     )
    res = cycle.cycle()
    print("CYCLE_ONE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res
    

# HVAC scheduler
def CycleOne1(self):
    l = self.lock
    start = time.time()
    
    category = settings.CATEGORIES[0][0] # this is HVAC
    subject = settings.SUBJECT_ONE
    template = settings.TEMPLATE_ONE
    
    try:
        sch = Scheduler.objects.get(category=category)
        sch_q = Scheduler.objects.filter(category=category)
    except Scheduler.DoesNotExist:
        return
    if sch.tick == 0:
        sch_q.update(event='Tick is 0. Scheduler stopped') 
        return
    
    clients = Clients.objects.filter(enable_mailing=True, category=category)
    
    promotion = Promotion.objects.obj_contents(category)
    if promotion is None:
        sch_q.update(event='Promotion does not exists')
        return
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
        
    sch_q.update(event='Scheduler works') 
    end = time.time()
    res = end - start
    print("CYCLE_ONE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Smat Home scheduler
def CycleTwo(self):
    
    cycle = Schedule(self.lock,
                     settings.CATEGORIES[1][0],
                     settings.SUBJECT_TWO,
                     settings.TEMPLATE_TWO
                     )
    res = cycle.cycle()
    print("CYCLE_TWO, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# IoT scheduler
def CycleThree(self):
    
    cycle = Schedule(self.lock,
                     settings.CATEGORIES[2][0],
                     settings.SUBJECT_THREE,
                     settings.TEMPLATE_THREE
                     )
    res = cycle.cycle()
    print("CYCLE_THREE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Facebook scheduler
def CycleFour(self):
    cycle = Schedule(self.lock,
                     settings.CATEGORIES[3][0],
                     settings.SUBJECT_FOUR,
                     settings.TEMPLATE_FOUR
                     )
    res = cycle.cycle()
    print("CYCLE_FOUR, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Mathematics scheduler
def CycleFive(self):
    cycle = Schedule(self.lock,
                     settings.CATEGORIES[4][0],
                     settings.SUBJECT_FIVE,
                     settings.TEMPLATE_FIVE
                     )
    res = cycle.cycle()
    print("CYCLE_FIVE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# SFUGD scheduler
def CycleSix(self):
    cycle = Schedule(self.lock,
                     settings.CATEGORIES[5][0],
                     settings.SUBJECT_SIX,
                     settings.TEMPLATE_SIX
                     )
    res = cycle.cycle()
    print("CYCLE_SIX, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res



