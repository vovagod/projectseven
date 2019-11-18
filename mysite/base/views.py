import time
from datetime import datetime, timedelta
from django.utils import timezone
from django.utils.translation import ugettext as _

from django.urls import reverse  #, reverse_lazy
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import ListView, DetailView, View
from django.views.generic.base import RedirectView
from django.views.generic.edit import FormView
from django.shortcuts import render, get_object_or_404, redirect

from django.shortcuts import render_to_response # remove after
from django.conf import settings

from django.http import HttpResponseRedirect
#from django.urls import reverse_lazy
#from django.core.urlresolvers import reverse

from mysite.mixins import NextUrlMixin, RequestFormAttachMixin
from mysite.base.forms import ContactForm
import mysite.urls


from .models import Base, Menu, SubMenu, Image
from interaction.models import Contact
from mail.sendmail import theme_search


class BaseRedirectView(RedirectView):

    permanent = False
    query_string = False
    pattern_name = 'mysite-base'
    #url = '/home/'
    #query_string = True

    def get_redirect_url(self, *args, **kwargs):
        #article = get_object_or_404(Article, pk=kwargs['pk'])
        #article.update_counter()
        #print('BaseRedirectView:{}'.format(kwargs))
        self.kwargs = kwargs
        return super(BaseRedirectView, self).get_redirect_url(*args, **kwargs)



def baseviewreverse(request, **kwargs):
    #print('BASE_VIEW_REVERSE:{}'.format(kwargs))
    return redirect('/home/', args='about')
    #return redirect('mysite:home', kwargs)
    #response = HttpResponseRedirect('/home/')
    #response['KWARGS'] = {'part':'about'}
    #print('RESPONSE:{}'.format(response.__dict__))
    #return response
    #return HttpResponseRedirect(reverse('/home/', kwargs))


# test view to check mailform
def emailview(request):
    msg = settings.MSG
    msg.update({'guest':_('Гость'),
                })
    return render_to_response('base/correspondence.html', msg,
                              content_type="text/html")



class BaseView(RequestFormAttachMixin, SuccessMessageMixin, FormView):
   
    form_class = ContactForm
    #success_url = '#success'
    #success_url = 'success'
    template_name = 'base/home.html'
    model = Base
    

    def get_success_message(self, cleaned_data):
        return self.success_message % dict(cleaned_data,)


    def get_context_data(self, *args, **kwargs):
        #show_flag = bool(self.request.GET.get('flag', False))
        #print('KWARGS:{}'.format(self.request.GET.get('part', False)))
        print('KWARGS:{}'.format(self.__dict__))
        context = super(BaseView, self).get_context_data(*args, **kwargs)
        context['menus'] = Menu.objects.obj_auth(self.request)
        context['contents'] = SubMenu.objects.obj_contents(self.request)
        context['images'] = Image.objects.obj_images(self.request)
        return context


    def form_valid(self, form):
        message, self.success_message = theme_search(form.cleaned_data['content'])
        form.send_email(message)
        #return super(BaseView, self).form_valid(form)
        return HttpResponseRedirect(reverse('base:success', args=('success',)))
    

    
