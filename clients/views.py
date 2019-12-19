import pathlib
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormView
from django.core.exceptions import ValidationError
from django.core.validators import FileExtensionValidator
from django.contrib import messages
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
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
    print('GET_COMMON_CONTEXT:{}'.format(category))
    msg = {}
    msg.update(settings.MSG)

    if hasattr(settings, category):
        msg.update(getattr(settings, category))
        
    #msg.update({'guest': guest,
                #'content': message,
                #'category': client_category,
                #'uuid': client_uuid,
                #'interested': client_uuid,
                #'preorder': client_uuid,
                #'lang': lang.lower(),
                #})
    #msg = settings.MSG
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
            self.action = settings.ACTION_UNSUBSCRIBE
        if action == 'interested':
            Clients.objects.filter(uuid=uuid).update(interested=True)
            self.action = settings.ACTION_INTERESTED
        if action == 'preorder':
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
        context = super(ClientsPreorderView, self).get_context_data(*args, **kwargs)
        context['introduction'] = mark_safe(settings.INTRODUCTION)
        context['asterisk'] = mark_safe(settings.ASTERISK)
        return get_common_context('None', context)

    def form_valid(self, form):
        phrase = format_html("<h4>Client with UUID: <a href='http://{}/admin/clients/clients/{}/change/'>{}</a> has made a preorder.</h4>",
                             '{}'.format(settings.DOMAIN),
                             '{}'.format(self.uuid),
                             '{}'.format(self.uuid),
                             )
        message = {'text': phrase}
        err = send_mail('Preorder made', 'admin', message, 'Admin', 'correspondence')
        if err:
            Clients.objects.filter(uuid=self.uuid).update(error_mailing=str(err)[1:-2])
        # finalize this script later
        Clients.objects.filter(uuid=self.uuid).update(preorder=True)
        return HttpResponseRedirect(reverse('clients:action', args=('preorder', self.uuid,)))

    def form_invalid(self, form):
        return HttpResponseRedirect(reverse('clients:preorder', args=(self.uuid,)))



# for test, use example: '.../email/buy/5605abb0-d0a0-4da8-a5f1-9869f7f498c2'
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
            #self.category = instance.category
            #path = settings.MEDIA_ROOT+'/uploads/{company}/'.format(company=instance.slug)
            #instance.filepath = path
            instance.save()
            #pathlib.Path(path).mkdir(parents=True, exist_ok=True)
            
            #file_validator = FileExtensionValidator(settings.VALID_EXTENSIONS)
            #for f in files:
                #try:
                    #file_validator(File(name=str(f)))
                #except ValidationError as e:
                    #err = '; '.join(e)
                    #messages.add_message(request, messages.INFO, err)
                    #return self.form_invalid(form)
                #handle_uploaded_file(path+'{filename}'.format(filename=str(f)), f)
            return self.form_valid(form)
        else:
            return self.form_invalid(form)

    def get_context_data(self, *args, **kwargs):
        context = super(ClientsBuyView, self).get_context_data(*args, **kwargs)
        context['introduction'] = mark_safe(settings.INTRODUCTION)
        context['asterisk'] = mark_safe(settings.ASTERISK)
        return get_common_context('None', context)

    def form_valid(self, form):
        phrase = format_html("<h4>Client with UUID: <a href='http://{}/admin/clients/clients/{}/change/'>{}</a> has made a bid.</h4>",
                             '{}'.format(settings.DOMAIN),
                             '{}'.format(self.uuid),
                             '{}'.format(self.uuid),
                             )
        message = {'text': phrase}
        err = send_mail('Bid made', 'admin', message, 'Admin', 'correspondence')
        if err:
            Clients.objects.filter(uuid=self.uuid).update(error_mailing=str(err)[1:-2])
        # finalize this script later
        Clients.objects.filter(uuid=self.uuid).update(preorder=True)
        return HttpResponseRedirect(reverse('clients:action', args=('bid', self.uuid,)))

    def form_invalid(self, form):
        return HttpResponseRedirect(reverse('clients:buy', args=(self.uuid,)))



