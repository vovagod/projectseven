from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from django.template.loader import get_template


def send_mail(subject, to, message, guest):

    from_email = settings.EMAIL_HOST_USER
    path = 'http://'+settings.DOMAIN+'/static/media/'
    if settings.DEBUG:
        path = '/media/'
        
    html_file = get_template('base/email.html')
    msg = {'letter':path+'letter.png',
            'guest': guest,
            'messages': message,
            'url':'http://'+settings.DOMAIN,
            'logo': path+'logo.png',
            'website':path+'website.png',
            'phone':path+'phone.png',
            'email':path+'email.png',
            'address':path+'address.png',
            'mobile':settings.PHONE,
            'mail':settings.EMAIL_HOST_USER,
            'comaex_demo':settings.COMAEX_DEMO,
            'domain':settings.DOMAIN,
            'addr':settings.ADDRESS,
            'title':settings.FOOTER_TITLE,
            }
    text_content = 'This is an important message'
    html_content = html_file.render(msg)

    msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
    msg.attach_alternative(html_content, "text/html")
    msg.send()
    # send email using the self.cleaned_data dictionary
    return
