import sys
from django.contrib import admin
from markdown import markdown
from .models import Promotion, Image



class ImageInline(admin.StackedInline):
    model = Image
    extra = 1
    fields = (('name', 'image'),
              ('title', 'sentence'),
              ('urllink'),
              ('description'),
              )
    exclude = ('slug',)
    

class PromotionAdmin(admin.ModelAdmin):
    list_display = ['id', 'category', 'language', 'title','timestamp' ]
    fields = (('category', 'language'),
              ('title', 'slug'),
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


    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for obj in formset.deleted_objects:
            obj.delete()
        for instance in instances:
            instance.desc_html = markdown(instance.description)
            instance.save()
        formset.save_m2m()


def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
