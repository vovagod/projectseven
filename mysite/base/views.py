import time
from datetime import datetime, timedelta
from django.utils import timezone
from django.utils.translation import ugettext as _

from django.urls import reverse
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import ListView, DetailView, View
from django.views.generic.edit import FormView
from django.shortcuts import render, get_object_or_404, redirect

from mysite.mixins import NextUrlMixin, RequestFormAttachMixin
from mysite.base.forms import ContactForm

from .models import Base, Menu, SubMenu, Contact


def baseviewreverse(request):
    return redirect('/about/')


class BaseView(RequestFormAttachMixin, SuccessMessageMixin, FormView):
    print('We are in BaseView function')
   
    form_class = ContactForm
    success_url = '/#contact'
    success_message = "Your request was reseived successfully"
    template_name = 'base/home.html'
    model = Base

    def get_success_message(self, cleaned_data):
        return self.success_message % dict(cleaned_data,)


    def get_context_data(self, *args, **kwargs):
        print('We are in get context data function of BaseView')
        start = time.time()
        context = super(BaseView, self).get_context_data(*args, **kwargs)
        context['menus'] = Menu.objects.obj_auth(self.request)
        context['contents'] = SubMenu.objects.obj_contents(self.request)
        end = time.time()
        res = end - start
        print("BASEVIEW,START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
        return context


    def form_valid(self, form):
        print('Form data, self{}, form:{}'.format(self, form.cleaned_data))
        # This method is called when valid form data has been POSTed.
        # It should return an HttpResponse.
        form.send_email()
        return super(BaseView, self).form_valid(form)
