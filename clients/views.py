import pathlib
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormView
from django.core.exceptions import ValidationError
from django.core.validators import FileExtensionValidator
from django.contrib import messages
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from django.utils import translation
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.urls import reverse
from collections import namedtuple
from mysite.mixins import RequestFormAttachMixin
from django.utils.safestring import mark_safe
from django.utils.html import format_html
from .models import Clients
from .forms import PreorderForm, BuyForm
from mail.sendmail import send_mail


File = namedtuple('File', ['name'])


def download(request, folder, file):
    file_path = settings.MEDIA_ROOT+'/uploads/'+folder+'/'+file
    with open(file_path, 'rb') as fh:
        response = HttpResponse(fh.read(), content_type="application/force-download")
        response['Content-Disposition'] = 'inline; filename= "{}"'.format(file)
        return response


def handle_uploaded_file(path, f):
    with open(path, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)


def get_common_context(category, context):
    msg = {}
    msg.update(settings.MSG)
    
    if hasattr(settings, category):
        msg.update(getattr(settings, category))
        
    context['title'] = msg['title']
    context['addr'] = msg['addr']
    context['mobile'] = msg['mobile']
    context['mail'] = msg['mail']
    context['domain'] = msg['domain']
    context['shape'] = msg['shape']
    return context


def common_valid(self, word):
    phrase = format_html("<h4>Client with UUID: <a href='http://{}/{}/admin/clients/clients/{}/change/'>{}</a> has made a {}.</h4>",
                         '{}'.format(settings.DOMAIN),
                         '{}'.format(self.request.LANGUAGE_CODE),
                         '{}'.format(self.uuid),
                         '{}'.format(self.uuid),
                         '{}'.format(word)
                         )
    message = {'text': phrase}
    err = send_mail('A '+word+' made', 'admin', message, 'Admin', 'correspondence')
    if err:
        Clients.objects.filter(uuid=self.uuid).update(error_mailing=str(err)[1:-2])
    # finalize this script later
    Clients.objects.filter(uuid=self.uuid).update(preorder=True)
    return None
    


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
        translation.activate(self.obj.language.lower())
        if action == 'unsubscribe':
            Clients.objects.filter(uuid=uuid).update(enable_mailing=False)
            self.action = settings.ACTION_UNSUBSCRIBE
        if action == 'interested':
            Clients.objects.filter(uuid=uuid).update(interested=True)
            self.action = settings.ACTION_INTERESTED
        if action == 'pre-order':
            self.action = settings.ACTION_PREORDER
        if action == 'bid':
            self.action = settings.ACTION_BID
        return self.obj

    def get_context_data(self, **kwargs):
        context = super(ClientsActionView, self).get_context_data(**kwargs)
        context['action'] = self.action
        get_common_context(self.obj.category, context)
        return context


# for test, use example: '.../email/preorder/5605abb0-d0a0-4da8-a5f1-9869f7f498c2'
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
            path = settings.MEDIA_ROOT+'/uploads/{company}/'.format(company=instance.slug)
            instance.filepath = path
            instance.save()
            pathlib.Path(path).mkdir(parents=True, exist_ok=True)
            
            file_validator = FileExtensionValidator(settings.VALID_EXTENSIONS)
            for f in files:
                try:
                    file_validator(File(name=str(f)))
                except ValidationError as e:
                    err = '; '.join(e)
                    messages.add_message(request, messages.INFO, err)
                    return self.form_invalid(form)
                handle_uploaded_file(path+'{filename}'.format(filename=str(f)), f)
            return self.form_valid(form)
        else:
            return self.form_invalid(form)


    def get_context_data(self, *args, **kwargs):
        try:
            client = Clients.objects.get(uuid=self.kwargs['uuid'])
        except Clients.DoesNotExist:
            raise Http404("Client does not exist")
        translation.activate(client.language.lower())
        context = super(ClientsPreorderView, self).get_context_data(*args, **kwargs)
        context['introduction'] = mark_safe(settings.PREORDER)
        context['asterisk'] = mark_safe(settings.ASTERISK)
        return get_common_context(client.category, context)

    def form_valid(self, form):
        common_valid(self, 'preorder')
        return HttpResponseRedirect(reverse('clients:action', args=('pre-order', self.uuid,)))

    def form_invalid(self, form):
        return HttpResponseRedirect(reverse('clients:preorder', args=(self.uuid,)))



# for test, use example: '.../email/buy/5f2822da-1481-48fd-9e96-29424c189963'
class ClientsBuyView(RequestFormAttachMixin, FormView):

    form_class = BuyForm
    template_name = 'base/preorder.html'

    def post(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        self.uuid = self.request.path_info.strip('/').split('/')[-1]
        if form.is_valid():
            try:
                instance = Clients.objects.get(uuid=self.uuid)
            except Clients.DoesNotExist:
                raise Http404("Client does not exist")
            data = form.cleaned_data
            instance.address=data['company']
            instance.persons = data['persons']
            instance.phone = data['phone']
            instance.email2 = data['email2']
            instance.bid = data['bid']
            instance.save()
            return self.form_valid(form)
        else:
            return self.form_invalid(form)


    def get_context_data(self, *args, **kwargs):
        try:
            client = Clients.objects.get(uuid=self.kwargs['uuid'])
        except Clients.DoesNotExist:
            raise Http404("Client does not exist")
        translation.activate(client.language.lower())
        context = super(ClientsBuyView, self).get_context_data(*args, **kwargs)
        context['introduction'] = mark_safe(settings.BID)
        context['asterisk'] = mark_safe(settings.ASTERISK)
        return get_common_context(client.category, context)

    def form_valid(self, form):
        common_valid(self, 'bid')
        return HttpResponseRedirect(reverse('clients:action', args=('bid', self.uuid,)))

    def form_invalid(self, form):
        return super(ClientsBuyView, self).form_invalid(form)



