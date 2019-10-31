import sys
from django.contrib import admin
from django.contrib import messages
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.utils.translation import ugettext_lazy as _
from markdown import markdown
#from django.core.exceptions import MultipleObjectsReturned
#from admin_actions.admin import ActionsModelAdmin
from django_object_actions import DjangoObjectActions
from .models import Contact, Correspondence



class ContactAdmin(DjangoObjectActions, admin.ModelAdmin):
    list_display = ['id', 'subject', 'fullname', 'email', 'phone', 'timestamp']

    search_fields = ('fullname', 'timestamp',)
    
    
    fields = (('fullname'),
              ('email'),
              ('phone'),
              ('content'),
              ('ipaddr', 'flag'),
              )

    #readonly_fields = (
        #'action',
        #'timestamp',
    #)


  
    def responce_to_person(self, request, obj):
        corr_obj = Correspondence.objects.order_by('id').last()
        #print('CORR_OBJ:{}'.format(corr_obj.id))
        #corr = Correspondence(person_id_id=obj.id, name=obj.fullname, email=obj.email, phone=obj.phone)
        if corr_obj:
            corr_id = corr_obj.id+1
        else:
            corr_id = 1
        corr = Correspondence(id=corr_id, person_id_id=obj.id,
                              name=obj.fullname, email=obj.email,
                              phone=obj.phone,
                              theme='Переписка'
                              )
        corr.save()
        messages.info(request, _("Write a message to..."))
        return redirect(reverse_lazy('admin:interaction_correspondence_change', args=[obj.id,]))

    
    responce_to_person.label = "Write to person"  # optional
    responce_to_person.short_description = "Submit this article"  # optional

    change_actions = ('responce_to_person', )



    
class CorrespondenceAdmin(admin.ModelAdmin):
    list_display = ['id', 'theme', 'name', 'email', 'phone', 'timestamp', 'action']
    
    #fields = (('name'),
              #('email'),
              #('phone'),
              #('content'),
              #('flag', 'action'),
              #)

    readonly_fields = (
        'action',
        'timestamp',
    )

    fieldsets = (
        (_('Write responce'), {
            'fields': (
                'name',
                'email',
                'phone',
                'content',
            )
        }),
        (_('Responce status'), {
            'fields': ('action', 
            ),
        }),
        (_('Sent time'), {
            'fields': ('timestamp', 
            ),
        }),
        )


    def save_model(self, request, obj, form, change):
        print('SAVE_MODEL:{}'.format(obj.action))
        if obj.action:
            messages.error(request, _("The message was already sent, try another..."))
            return
        if obj.content == '':
            messages.error(request, _("Email message was not entered, try again..."))
            return
        messages.info(request, _("The message was sent successfully..."))
        #obj.content_html = markdown(obj.content)
        obj.save()
        



def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
