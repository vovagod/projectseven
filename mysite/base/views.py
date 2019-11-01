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

from .models import Base, Menu, SubMenu, Image
from interaction.models import Contact
from mail.sendmail import theme_search


def baseviewreverse(request):
    return redirect('/home/')

# test function to check mail form
def emailview(request):
    path = 'http://'+settings.DOMAIN+'/static/media/'
    if settings.DEBUG:
        path = '/media/'
    msg = {'letter':path+'letter.png',
           'guest':'Гость',
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
    return render_to_response('base/correspondence.html', msg,
                              content_type="text/html")



class BaseView(RequestFormAttachMixin, SuccessMessageMixin, FormView):
   
    form_class = ContactForm
    success_url = '/#success'
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
        message, self.success_message = theme_search(form.cleaned_data['content'])
        form.send_email(message)
        return super(BaseView, self).form_valid(form)
    
    
    

    
