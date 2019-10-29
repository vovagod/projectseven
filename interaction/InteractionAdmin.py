import sys
from django.contrib import admin
from django.contrib import messages
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.utils.translation import ugettext_lazy as _
from admin_actions.admin import ActionsModelAdmin
from django_object_actions import DjangoObjectActions
from .models import Contact, Correspondence



class ContactAdmin(DjangoObjectActions, admin.ModelAdmin):
    list_display = ['id', 'fullname', 'timestamp']
    fields = (('fullname'),
              ('email'),
              ('phone'),
              ('content'),
              ('ipaddr', 'flag'),
              )
    
  
    def responce_to_person(self, request, obj):
        print('RESPONCE_TO_PERSON:{}'.format(obj.__dict__))
        
        
        messages.info(request, _("Write a message..."))
        return redirect(reverse_lazy('admin:interaction_correspondence_add'))

    
    responce_to_person.label = "Write to person"  # optional
    responce_to_person.short_description = "Submit this article"  # optional

    change_actions = ('responce_to_person', )



    
class CorrespondenceAdmin(ActionsModelAdmin):
    list_display = ['id', 'name', 'timestamp']
    fields = (('name'),
              ('email'),
              ('phone'),
              ('content'),
              ('flag'),
              )



def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
