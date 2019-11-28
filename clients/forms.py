from django import forms
from django.core.validators import validate_email
from django.utils.translation import ugettext as _
from .models import Clients


app_name = 'clients'


class PreorderForm(forms.Form):
    
    company = forms.CharField(label=_("Имя компании * "),
                              widget=forms.TextInput(attrs={"required":True}))
    persons = forms.CharField(label="Контактное лицо", widget=forms.TextInput(attrs={"placeholder": _("Иванов Иван"),
                                                                                     "required":True}))
    address = forms.CharField(label="Адрес компании", widget=forms.TextInput(attrs={"placeholder": _("Москва, ул.Абвгдейка, 123"),
                                                                                    "required":True}))
    email2  = forms.EmailField(label=_("Эл.почта * "),
                               widget=forms.TextInput(attrs={"required":True}),
                               validators=[validate_email])
    phone   = forms.CharField(label=_("Телефон * "),
                              widget=forms.TextInput(attrs={"required":True}))
    file    = forms.FileField(label=_("Выберете файлы в формате pdf, doc, docx, jpg, png, xlsx, xls"),
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
                                                
