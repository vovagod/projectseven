from datetime import datetime, timedelta
import time
from django.utils import timezone
from django.utils.translation import ugettext_lazy as _

from django.conf import settings
from scheduler.models import Scheduler
from clients.models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail


class Schedule(object):

    def __init__(self, lock, category):
        self.l = lock
        self.category = category
        self.subject = settings.SUBJECT_MAIL.get(category,)
        self.template = settings.TEMPLATE_MAIL.get(category,)

    def cycle (self):
        start = time.time()
    
        try:
            sch = Scheduler.objects.get(category=self.category)
            sch_q = Scheduler.objects.filter(category=self.category)
        except Scheduler.DoesNotExist:
            return
        
        if sch.tick == 0:
            sch_q.update(event=_('Tick is 0. Scheduler stopped'), processing=_('None')) 
            return
    
        clients = Clients.objects.filter(enable_mailing=True, category=self.category)
        if clients is None:  #test it !
            sch_q.update(event=_('Client does not exists'))
            return
        
        lan = []
        for l in Promotion.objects.filter(category=self.category):
            lang={l.language:Promotion.objects.obj_contents(self.category, l.language)}
            lan.append(lang)
        
        for client in clients:
            cl = Clients.objects.filter(uuid=client.uuid)
            if client.counter < sch.tick:
                cl.update(counter=client.counter+1)
                continue
            self.l.acquire()
            
            promotion = [list(p.values()) for p in lan if next(iter(p))==client.language]
            
            if len(promotion) == 0:
                cl.update(error_mailing=_('Promotion does not exists'))
                continue
            
            err = send_mail(self.subject, client.email, promotion[0][0],
                            client.company, self.template, client.language)
            if err:
                cl.update(error_mailing=str(err)[1:-2])
            else:
                cl.update(counter=0, count=client.count+1, error_mailing= '')
            self.l.release()
        
        end = time.time()
        res = end - start
        sch_q.update(event=_('Scheduler works'), processing="%.2f" % res)
        return res


# HVAC scheduler
def CycleOne(self):
    cycle = Schedule(self.lock, settings.CATEGORIES[0][0])
    res = cycle.cycle()
    #print("CYCLE_ONE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Smat Home scheduler
def CycleTwo(self):
    cycle = Schedule(self.lock, settings.CATEGORIES[1][0])
    res = cycle.cycle()
    #print("CYCLE_TWO, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# IoT scheduler
def CycleThree(self):
    cycle = Schedule(self.lock, settings.CATEGORIES[2][0])
    res = cycle.cycle()
    #print("CYCLE_THREE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Facebook scheduler
def CycleFour(self):
    cycle = Schedule(self.lock, settings.CATEGORIES[3][0])
    res = cycle.cycle()
    #print("CYCLE_FOUR, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# Mathematics scheduler
def CycleFive(self):
    cycle = Schedule(self.lock, settings.CATEGORIES[4][0])
    res = cycle.cycle()
    #print("CYCLE_FIVE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res


# SFUGD scheduler
def CycleSix(self):
    cycle = Schedule(self.lock, settings.CATEGORIES[5][0])
    res = cycle.cycle()
    #print("CYCLE_SIX, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res

