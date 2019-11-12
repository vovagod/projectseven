from django import forms
#from .widgets import ClearableMultipleFilesInput
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.forms import ModelForm
from django.http import Http404
from .models import Clients


app_name = 'clients'


class FileFieldForm(forms.Form):
    
    company = forms.CharField(label="Имя компании (измените, если не соответствует)",
                              widget=forms.TextInput(attrs={"required":True}))
    persons = forms.CharField(label="Контактное лицо", widget=forms.TextInput(attrs={"placeholder": "Иванов Иван",
                                                                                     "required":True}))
    address = forms.CharField(label="Адрес компании", widget=forms.TextInput(attrs={"placeholder": "Москва, ул.Абвгдейка, 123",
                                                                                    "required":True}))
    email2  = forms.EmailField(label="Эл.почта (измените, если не соответствует)",
                               widget=forms.TextInput(attrs={"required":True}),
                               validators=[validate_email])
    phone   = forms.CharField(label="Телефон (измените, если не соответствует)",
                              widget=forms.TextInput(attrs={"required":True}))
    file    = forms.FileField(label="Выберете файлы в формате word, pdf, exel, jpg, png",
                              widget=forms.ClearableFileInput(attrs={'multiple': True, "required":True}))



    def __init__(self, request, *args, **kwargs):
        self.instance = kwargs.pop('instance', None)
        self.request = request
        uuid = self.request.path_info.strip('/').split('/')[-1]
        instance = Clients.objects.get(uuid=uuid)
        print('__INIT__:{}'.format(self.request.POST.get('company')))
        super(FileFieldForm, self).__init__(*args, **kwargs)
        self.initial['company'] = instance.company
        self.initial['email2'] = instance.email
        self.initial['phone'] = instance.phone
                                                


class PreorderForm(ModelForm):
    
    class Meta:
        model = Clients
        fields = ['company', 'address', 'persons',
                  'phone', 'email2', 'file',
                  ]
        #file = forms.FileField(widget=forms.ClearableFileInput(attrs={'multiple': True}))


    def __init__(self, request, *args, **kwargs):
        self.request = request
        super(PreorderForm, self).__init__(*args, **kwargs)


    def clean(self, *args):
        cleaned_data = super(PreorderForm, self).clean()
        data = self.cleaned_data
        uuid = self.request.path_info.strip('/').split('/')[-1]
        #print('PREORDERFORM_CLEAN:{}'.format(self.request.path_info.strip('/').split('/')[-1]))
        #files = request.FILES.getlist('files')

        if data.get('file') is None:
            raise forms.ValidationError("Enter a valid file format", code='file_error')
        try:
            instance = Clients.objects.get(uuid=uuid)
        except Clients.DoesNotExist:
            raise Http404("Client does not exist")
        #f = PreorderForm(instance=instance)
        instance.address=data['address']
        instance.file=data['file']
        instance.persons = data['persons']
        instance.phone = data['phone']
        instance.email2 = data['email2']
        instance.save()
        #f.save()
                #return HttpResponseRedirect('/success/url/')
        #else:
            #form = PreorderForm()
        return cleaned_data
