#import time
#from datetime import datetime, timedelta
#from django.utils import timezone
from django.utils.translation import ugettext_lazy as _
from django.urls import reverse
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic.base import RedirectView
from django.views.generic.edit import FormView
from django.shortcuts import render_to_response # remove after
from django.conf import settings
from django.http import HttpResponseRedirect
from django.core.cache import cache

from mysite.mixins import RequestFormAttachMixin
from mysite.base.forms import ContactForm
from .models import Base, Menu, SubMenu, Image
from interaction.models import Contact
from mail.sendmail import theme_search



# test view to check mailform
def emailview(request):
    msg = settings.MSG
    msg.update({'guest':_('Guest'),
                })
    return render_to_response('base/correspondence.html', msg,
                              content_type="text/html")


class BaseRedirectView(RedirectView):

    permanent = False
    query_string = False
    url = '/home/'

    def get_redirect_url(self, *args, **kwargs):
        cache.set('part', kwargs.get('part'), 9)
        return super(BaseRedirectView, self).get_redirect_url(*args, **kwargs)


class BaseView(RequestFormAttachMixin, SuccessMessageMixin, FormView):
   
    form_class = ContactForm
    success_url = '/home/success/'
    template_name = 'base/home.html'
    model = Base
    

    def get_success_message(self, cleaned_data):
        return self.success_message % dict(cleaned_data,)


    def get_context_data(self, *args, **kwargs):
        part = cache.get('part')
        cache.delete('part')
        context = super(BaseView, self).get_context_data(*args, **kwargs)
        context['part'] = part
        context['menus'] = Menu.objects.obj_auth(self.request)
        context['contents'] = SubMenu.objects.obj_contents(self.request)
        context['images'] = Image.objects.obj_images(self.request)
        return context


    def form_valid(self, form):
        info, self.success_message = theme_search(form.cleaned_data['content'])
        form.send_email(info)
        return super(BaseView, self).form_valid(form)


    def form_invalid(self, form):
        return super(BaseView, self).form_invalid(form)
    

    
