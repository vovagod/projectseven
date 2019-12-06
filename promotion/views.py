from django.shortcuts import render_to_response
from django.conf import settings
from django.utils.translation import ugettext as _
from django.http import Http404
from clients.models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail


# test view to check promotion email
# format example: '.../promotion/gva008@gmail.com/SFUGD'
def promotionview(request, email=None, category=None):
    
    if (category, category) not in settings.CATEGORIES:
        raise Http404("Promotion of such category does not exist")
    
    subject = settings.SUBJECT_ONE
    template = settings.TEMPLATE_ONE
    
    try:
        clients = Clients.objects.filter(enable_mailing=True, category=category)
    except IndexError:
        raise Http404("Client with this category does not exist")    
    promotion = Promotion.objects.obj_contents(category)
    if promotion is None:
        raise Http404("Promotion of this category does not exist")
    try:
        client = Clients.objects.get_pk(email)
    except Clients.DoesNotExist:
        raise Http404("Client with this email does not exist")
    msg = {}
    msg.update(settings.MSG)
    
    #if category == 'SFUGD':
        #msg.update(settings.SFUGD)
    
    if hasattr(settings, category):
        msg.update(getattr(settings, category))
        
    msg.update({'guest':_('Гость'),
                'content':Promotion.objects.obj_contents(category),
                'unsubscribe': client,
                'interested': client,
                'preorder': client,
                })

    return render_to_response('base/proposition.html', msg,
                              content_type="text/html")
