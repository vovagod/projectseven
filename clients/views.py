from django.shortcuts import render_to_response
from django.views.generic.detail import DetailView
from django.core.exceptions import ValidationError
from django.conf import settings
from django.http import Http404
from .models import Clients


class ClientsUnsubscribeView(DetailView):
    print('We are in ClientsUnsubscribe')
    model = Clients
    template_name = 'base/unsubscribe.html'
    #fields = ['enable_mailing']
    #query_pk_and_slug = True
    #template_name_suffix = '_update_form'


    def get_object(self):
        print('GET_OBJECT:{}'.format(self.__dict__))
        uuid = self.kwargs['uuid']
        try:
            self.obj = Clients.objects.get(uuid=uuid)
        except ValidationError:
            raise Http404("Such UUID does not exist")
        except Clients.DoesNotExist:
            raise Http404("Client does not exist")
        Clients.objects.filter(uuid=uuid).update(enable_mailing=False)
        #context = super(ClientsUnsubscribe, self).get_object(*args, **kwargs)
        #context['unsubscribe'] = 'Вы успешно отписались от рассылки'
        return self.obj
        #msg = settings.MSG
        #msg.update({'guest':self.obj.company,
                    #'unsubscribe':'Вы успешно отписались от рассылки', 
                    #})
        #return render_to_response('base/unsubscribe.html',
                                  #{'unsubscribe':'Вы успешно отписались от рассылки'},
                              #content_type="text/html")


    def get_context_data(self, **kwargs):
        #print('GET_CONTEX_DATA:{}'.format(self.__dict__))
        context = super(ClientsUnsubscribeView, self).get_context_data(**kwargs)
        context['unsubscribe'] = 'Вы успешно отписались от рассылки'
        context['context'] = settings.MSG
        
        return context



class ClientsInterestedView(DetailView):
    print('We are in ClientsInterested')
    model = Clients
    template_name = 'base/interested.html'
    #fields = ['enable_mailing']
    #query_pk_and_slug = True
    #template_name_suffix = '_update_form'


    def get_object(self):
        print('GET_OBJECT:{}'.format(self.__dict__))
        uuid = self.kwargs['uuid']
        try:
            self.obj = Clients.objects.get(uuid=uuid)
        except ValidationError:
            raise Http404("Such UUID does not exist")
        except Clients.DoesNotExist:
            raise Http404("Client does not exist")
        Clients.objects.filter(uuid=uuid).update(interested=True)
        #context = super(ClientsUnsubscribe, self).get_object(*args, **kwargs)
        #context['unsubscribe'] = 'Вы успешно отписались от рассылки'
        return self.obj
        #msg = settings.MSG
        #msg.update({'guest':self.obj.company,
                    #'unsubscribe':'Вы успешно отписались от рассылки', 
                    #})
        #return render_to_response('base/unsubscribe.html',
                                  #{'unsubscribe':'Вы успешно отписались от рассылки'},
                              #content_type="text/html")


    def get_context_data(self, **kwargs):
        #print('GET_CONTEX_DATA:{}'.format(self.__dict__))
        context = super(ClientsInterestedView, self).get_context_data(**kwargs)
        context['Interested'] = 'Спасибо, благодарим вас за оценку!'
        context['context'] = settings.MSG
        
        return context

        
