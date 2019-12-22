import sys
from django.contrib import admin
from django.utils import translation
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

