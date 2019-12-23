import sys
from django.contrib import admin
from django.utils import translation
from django.utils.translation import ugettext_lazy as _
from django.conf import settings
from .models import Scheduler



class SchedulerAdmin(admin.ModelAdmin):
    
    list_display = ['id', 'category', 'tick', 'event', 'processing' ]

    readonly_fields = (
        'id',
        'counter',
        'event',
        'processing',
    )
    
    fields = (('id'),
              ('category'),
              ('tick'),
              #('counter'),
              ('event'),
              ('processing'),
              )


    def save_model(self, request, obj, form, change):
        if obj.tick == 0:
            obj.event = _('Tick is 0. Scheduler stopped')
            obj.processing = _('No data')
        else:
            obj.event = _('Scheduler works')
            obj.processing = _('Pending...')
        obj.save()


    def has_module_permission(self, request):
        if translation.get_language_from_request(request, check_path=True) != settings.LANGUAGE_CODE:
            return False
        return True
   

def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj

