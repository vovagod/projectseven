from django.shortcuts import render_to_response
from django.views.generic.detail import DetailView
from django.core.exceptions import ValidationError
from django.conf import settings
from django.http import Http404
from .models import Clients


class ClientsActionView(DetailView):
    model = Clients
    template_name = 'base/action.html'


    def get_object(self):
        uuid = self.kwargs['uuid']
        action = self.kwargs['action']
        try:
            self.obj = Clients.objects.get(uuid=uuid)
        except ValidationError:
            raise Http404("Such UUID does not exist")
        except Clients.DoesNotExist:
            raise Http404("Client does not exist")
        if action == 'unsubscribe':
            Clients.objects.filter(uuid=uuid).update(enable_mailing=False)
            self.action = 'Вы успешно отписались от рассылки'
        if action == 'interested':
            Clients.objects.filter(uuid=uuid).update(interested=True)
            self.action = 'Спасибо, благодарим вас за оценку!'
        return self.obj


    def get_context_data(self, **kwargs):
        context = super(ClientsActionView, self).get_context_data(**kwargs)
        msg = settings.MSG
        context['action'] = self.action
        context['title'] = msg['title']
        context['addr'] = msg['addr']
        context['mobile'] = msg['mobile']
        context['mail'] = msg['mail']
        context['domain'] = msg['domain']
        return context

        
