from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.core.mail import EmailMultiAlternatives
#from django.contrib.gis.geoip import GeoIP

from django.template.loader import get_template
from django.template import Context
from django.conf import settings

from django.utils.safestring import mark_safe
from interaction.models import Contact
from .fields import ListTextWidget
from ipware import get_client_ip


class ContactForm(forms.Form):
    
    fullname   = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Полное имя"}))
    email      = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Электронная почта"}),
                                 validators=[validate_email])
    phone      = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Телефон"}))
    content    = forms.CharField()

    def __init__(self, request, *args, **kwargs):
        self.request = request
        choice_list = kwargs.pop('data_list', None)
        placeholder = "Введите сообщение или выберете из списка..."
        autocomplete = "off"
        super(ContactForm, self).__init__(*args, **kwargs)
        self.fields['content'].widget = ListTextWidget(data_list=choice_list, name='choice-list',
                                                       placeholder=placeholder,
                                                       autocomplete=autocomplete,
                                                       )

    def clean(self):
        cleaned_data = super(ContactForm, self).clean()
        data = self.cleaned_data

        if data.get('email') is None:
            raise forms.ValidationError("Enter a valid email address", code='email_error')

        ip, is_routable = get_client_ip(self.request)
        if ip is None:
            ipaddr = None
        else:
            ipaddr = ip
            if is_routable:
                routable = 'public IP'
            else:
                routable = 'private IP'
        #if ipaddr and is_routable:
            #g = GeoIP()
            #city = g.city(ipaddr)
        #print('City:{}'.format(city))
        message = Contact(fullname=data['fullname'], email=data['email'],
                          phone=data['phone'], content=data['content'],
                          ipaddr=ipaddr or 'Unable to get IP address',
                          )
        message.save()
        return cleaned_data
   

    def send_email(self, message):
        path = 'http://'+settings.DOMAIN+'/static/media/'
        if settings.DEBUG:
            path = '/media/'
        subject, from_email, to = 'Request confirmation', settings.EMAIL_HOST_USER, self.cleaned_data.get("email")
        
        html_file = get_template('base/email.html')
        msg = {'letter':path+'letter.png',
               'guest':self.cleaned_data["fullname"],
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

