from django import forms
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.conf import settings
from django.http import Http404
from django.utils.translation import ugettext_lazy as _
from .models import Clients


app_name = 'clients'


class PreorderForm(forms.Form):
    
    company = forms.CharField(label=_("Company name * "),
                              widget=forms.TextInput(attrs={"required":True}))
    persons = forms.CharField(label=_("Contact person"), widget=forms.TextInput(attrs={"placeholder": _("Peter Smith"),
                                                                                       "required":True}))
    address = forms.CharField(label=_("Company address"), widget=forms.TextInput(attrs={"placeholder": _("Moscow, Red Square 123"),
                                                                                        "required":True}))
    email2  = forms.EmailField(label=_("Email * "),
                               widget=forms.TextInput(attrs={"required":True}),
                               #validators=[validate_email]
                               )
    phone   = forms.CharField(label=_("Phone * "),
                              widget=forms.TextInput(attrs={"required":True}))
    file    = forms.FileField(label=_("Select files in the formats: pdf, doc, docx, jpg, png, xlsx, xls"),
                              widget=forms.ClearableFileInput(attrs={'multiple': True, "required":True}))



    def __init__(self, request, *args, **kwargs):
        
        self.instance = kwargs.pop('instance', None)
        self.request = request
        self.uuid = self.request.path_info.strip('/').split('/')[-1]
        try:
            instance = Clients.objects.get(uuid=self.uuid)
        except ValidationError:
            raise Http404(_("Client with such UUID does not exist"))
        except Clients.DoesNotExist:
            raise Http404(_("Client does not exist")) 
        super(PreorderForm, self).__init__(*args, **kwargs)
        self.initial['company'] = instance.company
        self.initial['persons'] = instance.persons or None
        self.initial['address'] = instance.address or None
        self.initial['email2']  = instance.email
        self.initial['phone']   = instance.phone



class BuyForm(PreorderForm):
    
    bid     = forms.IntegerField(label=_("Your bid, USD"),
                                 widget=forms.NumberInput(attrs={"placeholder": settings.MIN_VALUE, "required":True,
                                                                 "min":settings.MIN_VALUE, "max": settings.MAX_VALUE}))
    address = None
    file    = None
                                                

                                                


                                                
