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
    #l.acquire()
    print('CycleOne')
    start = time.time()
    category = settings.CATEGORIES[0][0]
    subject = 'Business proposition'
    template = 'proposition'
    print('CATEGORY:{}'.format(category))
    try:
        sch = Scheduler.objects.get(category=category)
        print('SCHEDULER:{}'.format(sch))
    except Scheduler.DoesNotExist:
        return
    if sch.tick == 0:
        return
    clients = Clients.objects.filter(enable_mailing=True, category=category)
    print('CLIENTS:{}'.format(sch))
    promotion = Promotion.objects.obj_contents(category)
    #print('PROMOTION:{}'.format(promotion))
    for client in clients:
        l.acquire()
        try:
            print('PROMOTION:{}'.format(promotion))
            send_mail(subject, client.email, promotion, client.company, template)
        finally:
            l.release()

    end = time.time()
    res = end - start
    print("CYCLE_ONE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res
