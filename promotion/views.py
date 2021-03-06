from django.shortcuts import render_to_response
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from django.utils import translation
from django.http import Http404
from clients.models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail


# test view to check promotion email
# format example: '.../promotion/gva008@gmail.com/SFUGD/EN'
def promotionview(request, email=None, category=None, lang=None):

    if (lang, lang) not in settings.LANG:
        raise Http404("Such language does not exist")
    
    translation.activate(lang)
    
    if (category, category) not in settings.CATEGORIES:
        raise Http404("Promotion of such category does not exist")
    
    subject = settings.SUBJECT_MAIL.get(category,)
    template = settings.TEMPLATE_MAIL.get(category,)
    
    try:
        clients = Clients.objects.filter(enable_mailing=True, category=category)
    except IndexError:
        raise Http404("Client with this category does not exist")
    
    promotion = Promotion.objects.obj_contents(category, lang)
    if promotion is None:
        raise Http404("Promotion of this category does not exist")
    try:
        client = Clients.objects.get(email=email)
    except Clients.DoesNotExist:
        raise Http404("Client with this email does not exist")
    
    msg = {}
    msg.update(settings.MSG)
    
    if hasattr(settings, category):
        msg.update(getattr(settings, category))
        
    msg.update({'guest':_('Guest'),
                'content': promotion,
                'category': client.category,
                'uuid': client.uuid,
                'lang': lang.lower(),
                })

    return render_to_response('base/proposition.html', msg,
                              content_type="text/html")
