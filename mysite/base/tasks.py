from datetime import datetime
import time
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
            sch_q.update(event=_('Tick is 0. Scheduler stopped'), processing=_('No data')) 
            return
    
        clients = Clients.objects.filter(enable_mailing=True, category=self.category)
        if len(clients) == 0:
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
            try:
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
            finally:
                self.l.release()
        
        end = time.time()
        res = end - start
        sch_q.update(event=_('Scheduler works'), processing="%.2f" % res)
        return res



def CycleOne(self, category):
    cycle = Schedule(self.lock, category)
    res = cycle.cycle()
    print("SYRVEY, category:{}, start:{}, delay:{}".format(category, datetime.now(), res))
    return res

