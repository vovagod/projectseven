import sys
from django.contrib import admin
from .models import Contact


class ContactAdmin(admin.ModelAdmin):
    list_display = ['id', 'fullname', 'timestamp']
    fields = (('fullname', 'email'),
              ('phone'),
              ('content'),
              ('ipaddr', 'flag'),
              )


def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
