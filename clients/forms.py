from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.forms import ModelForm
from django.http import Http404
from .models import Clients


app_name = 'clients'


class PreorderForm(forms.Form):
    
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
    file    = forms.FileField(label="Выберете файлы в формате pdf, doc, docx, jpg, png, xlsx, xls",
                              widget=forms.ClearableFileInput(attrs={'multiple': True, "required":True}))



    def __init__(self, request, *args, **kwargs):
        self.instance = kwargs.pop('instance', None)
        self.request = request
        self.uuid = self.request.path_info.strip('/').split('/')[-1]
        instance = Clients.objects.get(uuid=self.uuid)
        super(PreorderForm, self).__init__(*args, **kwargs)
        self.initial['company'] = instance.company
        self.initial['persons'] = instance.persons or None
        self.initial['address'] = instance.address or None
        self.initial['email2'] = instance.email
        self.initial['phone'] = instance.phone
                                                