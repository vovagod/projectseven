import time
from datetime import datetime, timedelta
from django.utils import timezone
from django.utils.translation import ugettext as _

from django.urls import reverse
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import ListView, DetailView, View
from django.views.generic.edit import FormView
from django.shortcuts import render, get_object_or_404, redirect

from django.shortcuts import render_to_response # remove after
from django.conf import settings

from mysite.mixins import NextUrlMixin, RequestFormAttachMixin
from mysite.base.forms import ContactForm

from .models import Base, Menu, SubMenu, Contact, Image


def baseviewreverse(request):
    return redirect('/home/')

def emailview(request):
    msg = {'letter':'/media/letter.png',
           'guest':'Гость',
           'url':'',
           'logo': '/media/logo.png',
           'website':'/media/website.png',
           'phone':'/media/phone.png',
           'email':'/media/email.png',
           'address':'/media/address.png',
           }
    return render_to_response('base/email.html', msg,
                              content_type="text/html")


class BaseView(RequestFormAttachMixin, SuccessMessageMixin, FormView):
   
    form_class = ContactForm
    success_url = '/#success'
    success_message = "Ваш запрос успешно отправлен!"
    template_name = 'base/home.html'
    model = Base

    def get_success_message(self, cleaned_data):
        return self.success_message % dict(cleaned_data,)


    def get_context_data(self, *args, **kwargs):
        context = super(BaseView, self).get_context_data(*args, **kwargs)
        context['menus'] = Menu.objects.obj_auth(self.request)
        context['contents'] = SubMenu.objects.obj_contents(self.request)
        context['images'] = Image.objects.obj_images(self.request)
        return context


    def form_valid(self, form):
        # This method is called when valid form data has been POSTed.
        # It should return an HttpResponse.
        data = form.cleaned_data['content']
        data_list = data.split(' ')
        credentials = ['логин', 'пароль', 'вход']
        callme = ['заинтересовала', 'позвоните', 'позвонить']
        message = {'common':'Мы получили ваше сообщение и свяжемся с вами в ближайшее время.'}
        if any(n in data_list for n in credentials):
            message = {'credentials':'Для входа используйте логин: admin, пароль: admin12345.'}
            self.success_message = "данные для входа отправлены вам на почту"
        if any(n in data_list for n in callme):
            message = {'callme':'Мы свяжемся свами в ближайший час.'}
        form.send_email(message)
        return super(BaseView, self).form_valid(form)

    
