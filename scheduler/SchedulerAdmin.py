import sys
from django.contrib import admin
from .models import Scheduler



class SchedulerAdmin(admin.ModelAdmin):
    
    list_display = ['id', 'category', 'tick','counter' ]

    readonly_fields = (
        'id',
        'counter',
    )
    
    fields = (('id'),
              ('category'),
              ('tick'),
              ('counter'),
              )
   

def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj

