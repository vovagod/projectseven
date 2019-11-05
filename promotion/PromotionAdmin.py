import sys
from django.contrib import admin
from .models import Promotion, Image



class ImageInline(admin.StackedInline):
    model = Image
    extra = 1
    fields = (('name', 'image'),
              ('title', 'sentence'),
              ('description'),
              )
    exclude = ('slug',)
    

class PromotionAdmin(admin.ModelAdmin):
    list_display = ['id', 'category', 'title','timestamp' ]
    fields = (('category', 'title'),
              ('slug'),
              ('subtitle', 'sentence'),
              ('description'),
              ('urllink', 'flag'),
              ('image'),
              ('data1', 'data2', 'data3', 'data4'),
              )
    prepopulated_fields = {'slug': ('category', )}

    inlines = [
        ImageInline,
    ]


def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
