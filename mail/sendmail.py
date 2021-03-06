from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _
from django.utils import translation
from django.http import Http404
from django.template.loader import get_template

from django.utils import timezone
#import pytz
from smtplib import SMTPException
from clients.models import Clients



def theme_search(data):
    data_list = data.split(' ')
    credentials = settings.CREDENTIALS
    callme = settings.CALLME
    success = settings.SUCCESS
    message = settings.MESSAGE_COMMON
    if any(n in data_list for n in credentials):
        message = settings.MESSAGE_CREDENTIALS
        success = settings.MESSAGE_SUCCESS
        return message, success
    if any(n in data_list for n in callme):
        message = settings.MESSAGE_CALLME
    return message, success


def send_mail(subject, to, message, guest, template, lang=settings.LANGUAGE_CODE):

    translation.activate(lang)
    from_email = settings.FROM
    html_file = get_template('base/'+template+'.html')
    
    client_category, client_uuid = 'None', None
    if subject != 'no-reply':
        try:
            #client = Clients.objects.get_pk(to)
            client = Clients.objects.get(email=to)
            client_category, client_uuid = client.category, client.uuid
        except Clients.DoesNotExist:
            try:
                admin = User.objects.get(username=to)
                to = admin.email
                guest = admin.username
                client = None
            except User.DoesNotExist:
                raise Http404("Such user does not exist")
        
    msg = {}
    msg.update(settings.MSG)

    if hasattr(settings, client_category):
        msg.update(getattr(settings, client_category))
        
    msg.update({'guest': guest,
                'content': message,
                'category': client_category,
                'uuid': client_uuid,
                'lang': lang.lower(),
                })
    text_content = _('This is an important message')
    html_content = html_file.render(msg)

    msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
    msg.attach_alternative(html_content, "text/html")
    err = None
    try:
        msg.send()
        Clients.objects.filter(uuid=client_uuid).update(last_post=timezone.now())
    except SMTPException as e:
        err = e
    return err

