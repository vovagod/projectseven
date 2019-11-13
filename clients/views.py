import pathlib
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormView
from django.core.exceptions import ValidationError
from django.core.validators import FileExtensionValidator
from django.contrib import messages
from django.conf import settings
from django.utils.translation import ugettext as _
from django.http import Http404, HttpResponseRedirect
from django.urls import reverse
from collections import namedtuple
from mysite.mixins import RequestFormAttachMixin
from django.utils.safestring import mark_safe
from .models import Clients
from .forms import PreorderForm
from mail.sendmail import send_mail


File = namedtuple('File', ['name'])


def handle_uploaded_file(path, f):
    with open(path, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)


def get_common_context(context):
    msg = settings.MSG
    context['title'] = msg['title']
    context['addr'] = msg['addr']
    context['mobile'] = msg['mobile']
    context['mail'] = msg['mail']
    context['domain'] = msg['domain']
    return context
    


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
            self.action = _('Вы успешно отписались от рассылки')
        if action == 'interested':
            Clients.objects.filter(uuid=uuid).update(interested=True)
            self.action = _('Благодарим вас за оценку!')
        if action == 'success':
            self.action = _('Спасибо, ваш предзаказ получен!')
        return self.obj


    def get_context_data(self, **kwargs):
        context = super(ClientsActionView, self).get_context_data(**kwargs)
        context['action'] = self.action
        get_common_context(context)
        return context



class ClientsPreorderView(RequestFormAttachMixin, FormView):

    form_class = PreorderForm
    template_name = 'base/preorder.html'


    def post(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        files = request.FILES.getlist('file')
        self.uuid = self.request.path_info.strip('/').split('/')[-1]
        if form.is_valid():
            try:
                instance = Clients.objects.get(uuid=self.uuid)
            except Clients.DoesNotExist:
                raise Http404("Client does not exist")
            data = form.cleaned_data
            instance.address=data['address']
            instance.persons = data['persons']
            instance.phone = data['phone']
            instance.email2 = data['email2']
            instance.save()
            path = settings.MEDIA_ROOT+'/uploads/{company}/'.format(company=instance.slug)
            pathlib.Path(path).mkdir(parents=True, exist_ok=True)
            file_validator = FileExtensionValidator(settings.VALID_EXTENSIONS)
            for f in files:
                try:
                    file_validator(File(name=str(f)))
                except ValidationError as e:
                    err = '; '.join(e)
                    messages.add_message(request, messages.INFO, err)
                    return self.form_invalid(form)
                path += '{filename}'.format(filename=str(f))
                handle_uploaded_file(path, f)
            return self.form_valid(form)
        else:
            return self.form_invalid(form)


    def get_context_data(self, *args, **kwargs):
        context = super(ClientsPreorderView, self).get_context_data(*args, **kwargs)
        context['introduction'] = mark_safe(settings.INTRODUCTION)
        return get_common_context(context)


    def form_valid(self, form):
        message = {'text':'Client with uuid: '+self.uuid+' has made a preorder. Congratulation!'}
        send_mail('Preorder made', 'admin', message, 'Admin', 'correspondence')
        return HttpResponseRedirect(reverse('clients:action', args=('success', self.uuid,)))

    
    def form_invalid(self, form):
        return HttpResponseRedirect(reverse('clients:preorder', args=(self.uuid,)))

