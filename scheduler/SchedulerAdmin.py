import sys
from django.contrib import admin
from .models import Scheduler



class SchedulerAdmin(admin.ModelAdmin):
    
    list_display = ['id', 'category', 'tick','counter', 'event', 'processing' ]

    readonly_fields = (
        'id',
        'counter',
        'event',
        'processing',
    )
    
    fields = (('id'),
              ('category'),
              ('tick'),
              ('counter'),
              ('event'),
              ('processing'),
              )
   

def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj

