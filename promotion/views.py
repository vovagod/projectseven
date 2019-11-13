from django.shortcuts import render_to_response
from django.conf import settings
from django.utils.translation import ugettext as _
from django.http import Http404
from clients.models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail


# test view to check promotion email
def promotionview(request, email=None):
    category = settings.CATEGORIES[0][0]
    subject = 'Business proposition'
    template = 'proposition'
    clients = Clients.objects.filter(enable_mailing=True, category=category)
    promotion = Promotion.objects.obj_contents(category)
    try:
        client = Clients.objects.get_pk(email)
    except Clients.DoesNotExist:
        raise Http404("Client does not exist")
    msg = settings.MSG
    msg.update({'guest':_('Гость'),
                'content':Promotion.objects.obj_contents(category),
                'unsubscribe': client,
                'interested': client,
                'preorder': client,
                })

    return render_to_response('base/proposition.html', msg,
                              content_type="text/html")
