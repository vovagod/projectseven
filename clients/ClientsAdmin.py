import sys
from django.contrib import admin
#from django.contrib import messages
#from django.shortcuts import redirect
#from django.urls import reverse_lazy
from django.utils.translation import ugettext_lazy as _
from .models import Clients



class ClientsAdmin(admin.ModelAdmin):
    list_display = ['company', 'category', 'email', 'phone', 'enable_mailing',]

    search_fields = ('company', 'category',)

    readonly_fields = (
        'created',
        'uuid',
    )
    
    fields = (('category', 'company', 'slug'),
              ('email', 'phone'),
              ('uuid', 'counter'),
              ('about'),
              ('file', 'error_mailing'),
              ('created', 'enable_mailing', 'interested', 'flag'),
              )
    
    prepopulated_fields = {'slug': ('company', )}
  


def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
