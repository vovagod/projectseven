from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from django.contrib.auth.models import User
from django.utils.translation import ugettext as _
from django.http import Http404
from django.template.loader import get_template
from clients.models import Clients



def theme_search(data):
    data_list = data.split(' ')
    credentials = [_('логин'), _('пароль'), _('вход'), _('данные'), _('входа')]
    callme = [_('заинтересовала'), _('позвоните'), _('позвони'), _('позвонить'), _('интересно'), _('свяжитесь')]
    success = _("Ваш запрос успешно отправлен!")
    message = {'common':_('Мы получили ваше сообщение и свяжемся с вами в ближайшее время.'),}
    if any(n in data_list for n in credentials):
        message = {'credentials':_('Для входа используйте логин: user, пароль: user12345.'),}
        success = _("Данные для входа отправлены вам на почту.")
    if any(n in data_list for n in callme):
        message = {'callme':_('Мы свяжемся свами в ближайший час.'),}
    return message, success


def send_mail(subject, to, message, guest, template):
    from_email = settings.FROM
    html_file = get_template('base/'+template+'.html')
    try:
        client = Clients.objects.get_pk(to)
    except Clients.DoesNotExist:
        try:
            admin = User.objects.get(username=to)
            to = admin.email
            guest = admin.username
            client = None
        except User.DoesNotExist:
            raise Http404("Such user does not exist")
    
    msg = settings.MSG
    msg.update({'guest': guest,
                'content': message,
                'unsubscribe': client,
                'interested': client,
                'preorder': client,
                })
    text_content = 'This is an important message'
    html_content = html_file.render(msg)

    msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
    msg.attach_alternative(html_content, "text/html")
    msg.send()
    return

