from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.core.mail import EmailMultiAlternatives

from django.template.loader import get_template
from django.template import Context
from django.conf import settings

from django.utils.safestring import mark_safe
from .models import Contact


#def ip_address_processor(request):
    #return {'ip_address': request.META['REMOTE_ADDR']}


class ContactForm(forms.Form):
    print('We are in ContactForm...')
    
    fullname   = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Полное имя"}))
    email      = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Электронная почта"}),
                                 validators=[validate_email])
    phone      = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Телефон"}))
    content    = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Сообщение"}))

    def __init__(self, request, *args, **kwargs):
        self.request = request
        super(ContactForm, self).__init__(*args, **kwargs)

    def clean(self):
        print('We are in clean() of ContactForm')
        cleaned_data = super(ContactForm, self).clean()
        #cc_email = self.cleaned_data.get("email")
        data = self.cleaned_data

        if data.get('email') is None:
            #msg = "Email error"
            #self.add_error('email', msg)
            #raise forms.ValidationError(mark_safe(msg))
            raise forms.ValidationError("Enter a valid email address", code='email_error')

        #data = self.cleaned_data
        message = Contact(fullname=data['fullname'], email=data['email'],
                          phone=data['phone'], content=data['content'],
                          ipaddr=self.request.META['REMOTE_ADDR']
                          )
        message.save()
        return cleaned_data
   

    def send_email(self):
        print('We are in send_email...')
        subject, from_email, to = 'request confirmation', 'comaex@comaex.com', self.cleaned_data.get("email")
        
        html_file = get_template('base/email.html')
        msg = {'letter':'/media/letter.png',
               'guest':self.cleaned_data["fullname"],
               'logo': '/media/logo.png',
               'website':'/media/website.png',
               'phone':'/media/phone.png',
               'email':'/media/email.png',
               'address':'/media/address.png',
               }
        text_content = 'This is an important message'
        html_content = html_file.render(msg)

        msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
        msg.attach_alternative(html_content, "text/html")
        msg.send()
        # send email using the self.cleaned_data dictionary
        return

