from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from django.template.loader import get_template
from clients.models import Clients



def theme_search(data):
    data_list = data.split(' ')
    credentials = ['логин', 'пароль', 'вход', 'данные', 'входа']
    callme = ['заинтересовала', 'позвоните', 'позвони', 'позвонить', 'интересно', 'свяжитесь']
    success = "Ваш запрос успешно отправлен!"
    message = {'common':'Мы получили ваше сообщение и свяжемся с вами в ближайшее время.',}
    if any(n in data_list for n in credentials):
        message = {'credentials':'Для входа используйте логин: user, пароль: user12345.',}
        success = "Данные для входа отправлены вам на почту."
    if any(n in data_list for n in callme):
        message = {'callme':'Мы свяжемся свами в ближайший час.',}
    return message, success


def send_mail(subject, to, message, guest, template):
    from_email = settings.FROM
    html_file = get_template('base/'+template+'.html')
    client = Clients.objects.get_pk(to)
    msg = settings.MSG
    msg.update({'guest': guest,
                'messages': message,
                'unsubscribe': client,
                'interested': client,
                })
    text_content = 'This is an important message'
    html_content = html_file.render(msg)

    msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
    msg.attach_alternative(html_content, "text/html")
    msg.send()
    # send email using the self.cleaned_data dictionary
    return

