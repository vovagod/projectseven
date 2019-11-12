from django.shortcuts import render_to_response
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormView
from django.core.exceptions import ValidationError
from django.conf import settings
from django.http import Http404
from mysite.mixins import RequestFormAttachMixin
from .models import Clients
from .forms import PreorderForm, FileFieldForm



def handle_uploaded_file(path, f):
    with open(path, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)


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



class ClientsPreorderView(RequestFormAttachMixin, FormView):  #RequestFormAttachMixin, 

    #form_class = PreorderForm
    form_class = FileFieldForm
    success_url = '/#success'
    template_name = 'base/preorder.html'
    #model = Clients


    def post(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        files = request.FILES.getlist('file')
        uuid = self.request.path_info.strip('/').split('/')[-1]
        if form.is_valid():
            try:
                instance = Clients.objects.get(uuid=uuid)
            except Clients.DoesNotExist:
                raise Http404("Client does not exist")
            data = form.cleaned_data
            instance.address=data['address']
            instance.persons = data['persons']
            instance.phone = data['phone']
            instance.email2 = data['email2']
            instance.save()
            for f in files:
                print('F:{}'.format(f))
                path = settings.MEDIA_ROOT+'/uploads/{company}/{filename}'.format(company=instance.slug,
                                                                                  filename=str(f))
                handle_uploaded_file(path, f)
            return self.form_valid(form)
        else:
            return self.form_invalid(form)


    def get_success_message(self, cleaned_data):
        return self.success_message % dict(cleaned_data,)


    def get_context_data(self, *args, **kwargs):
        context = super(ClientsPreorderView, self).get_context_data(*args, **kwargs)
        msg = settings.MSG
        #context['action'] = self.action
        context['title'] = msg['title']
        context['addr'] = msg['addr']
        context['mobile'] = msg['mobile']
        context['mail'] = msg['mail']
        context['domain'] = msg['domain']
        return context


    def form_valid(self, form):
        # This method is called when valid form data has been POSTed.
        # It should return an HttpResponse.
        #message, self.success_message = theme_search(form.cleaned_data['content'])
        #form.send_email(message)
        #self.uuid = self.kwargs.get('uuid')
        #print('FORM_VALID:{}'.format(self.__dict__))
        return super(ClientsPreorderView, self).form_valid(form) 
    
    

