from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
#from django.contrib.gis.geoip import GeoIP

from django.template import Context
from django.utils.safestring import mark_safe
from interaction.models import Contact
from .fields import ListTextWidget
from mail.sendmail import send_mail, theme_search
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

    def clean(self, *args):
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
        subject, m = theme_search(data.get('content'))
        message = Contact(fullname=data['fullname'], email=data['email'],
                          phone=data['phone'], content=data['content'],
                          ipaddr=ipaddr or 'Unable to get IP address',
                          subject=list(subject.keys())[0],
                          )
        message.save()
        return cleaned_data
   

    def send_email(self, message):
        subject, to = 'Request confirmation', self.cleaned_data.get("email")
        guest, template = self.cleaned_data["fullname"], 'confirmation'
        send_mail(subject, to, message, guest, template)
        return


