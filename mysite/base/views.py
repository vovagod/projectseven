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
from django.conf import settings #

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
    print('We are in BaseView function')
   
    form_class = ContactForm
    success_url = '/#contact'
    success_message = "Ваш запрос успешно получен"
    template_name = 'base/home.html'
    model = Base

    def get_success_message(self, cleaned_data):
        return self.success_message % dict(cleaned_data,)


    def get_context_data(self, *args, **kwargs):
        #print('We are in get context data function of BaseView...')
        #start = time.time()
        context = super(BaseView, self).get_context_data(*args, **kwargs)
        context['menus'] = Menu.objects.obj_auth(self.request)
        context['contents'] = SubMenu.objects.obj_contents(self.request)
        #for b in context['contents']:
            #print('CONTENTS:{}'.format(b['base']))
            #for c in b['base']:
                #print('BASE:{}'.format(c.id))
        context['images'] = Image.objects.obj_images(self.request)
        #for a in context['images']:
            #print('IMAGES:{}'.format(a.name_id))
            
        #end = time.time()
        #res = end - start
        #print("BASEVIEW,START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
        return context


    def form_valid(self, form):
        #print('Form data, self{}, form:{}'.format(self, form.cleaned_data))
        # This method is called when valid form data has been POSTed.
        # It should return an HttpResponse.
        form.send_email()
        return super(BaseView, self).form_valid(form)
