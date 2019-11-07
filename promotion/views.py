from django.shortcuts import render_to_response
from django.conf import settings
#from scheduler.models import Scheduler
from clients.models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail


# Create your views here.
def promotionview(request):
    category = settings.CATEGORIES[0][0]
    subject = 'Business proposition'
    template = 'proposition'
    print('CATEGORY:{}'.format(category))
    clients = Clients.objects.filter(enable_mailing=True, category=category)
    
    promotion = Promotion.objects.obj_contents(category)
    print('PROMOTION:{}'.format(promotion))
    client = Clients.objects.get_pk('chim73@mail.ru')
    msg = settings.MSG
    msg.update({'guest':'Гость',
                'content':Promotion.objects.obj_contents(category),
                'unsubscribe': client,
                'interested': client,
                })
        
    #for p in promotion[0]:
        #print('PROMOTION:{}'.format(p))
        #send_mail(subject, client.email, promotion, client.company, template)

    return render_to_response('base/proposition.html', msg,
                              content_type="text/html")
