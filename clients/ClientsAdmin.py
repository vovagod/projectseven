import sys
from django.contrib import admin
from django.contrib import messages
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.utils.translation import ugettext_lazy as _
#from markdown import markdown
#from django.core.exceptions import MultipleObjectsReturned
#from admin_actions.admin import ActionsModelAdmin
#from django_object_actions import DjangoObjectActions
from .models import Clients



class ClientsAdmin(admin.ModelAdmin):
    list_display = ['company', 'category', 'email', 'phone', 'enable_mailing',]

    search_fields = ('company', 'category',)

    readonly_fields = (
        'created',
        'uuid',
    )
    
    fields = (('category', 'company'),
              ('email', 'phone'),
              ('uuid', 'counter'),
              ('about'),
              ('created', 'enable_mailing', 'interested', 'flag'),
              )

    #readonly_fields = (
        #'action',
        #'timestamp',
    #)

  


def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj

