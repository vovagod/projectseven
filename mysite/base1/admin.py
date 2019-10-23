from django.contrib import admin
from django.core.exceptions import ValidationError
from markdown import markdown
from .models import Base, Menu, SubMenu, Contact, Image


class MenuAdmin(admin.ModelAdmin):
    list_display = ['title']
    fields = (('title', 'slug'),
              ('mark', 'fafa'),
              ('color'),
              )


class SubMenuAdmin(admin.ModelAdmin):
    list_display = ['subtitle']
    fields = (('submenu'),
              ('subtitle', 'subslug'),
              ('submark', 'subfafa'),
              ('subcolor'),
              )


class ImageInline(admin.StackedInline):
    model = Image
    extra = 1
    fields = (('name', 'image'),
              ('title', 'sentence'),
              ('description'),
              )
    exclude = ('slug',)
    

class BaseAdmin(admin.ModelAdmin):
    list_display = ['menu', 'title','timestamp' ]
    fields = (('menu', 'title'),
              ('slug'),
              ('subtitle', 'sentence'),
              ('description'),
              ('urllink', 'filenum', 'flag'),
              ('image'),
              ('data1', 'data2', 'data3', 'data4'),
              )
    prepopulated_fields = {'slug': ('menu', )}

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
            print('SAVE_FORMSET:{}'.format(instance.desc_html))
        formset.save_m2m()
        


class ContactAdmin(admin.ModelAdmin):
    list_display = ['id', 'fullname', 'timestamp']
    fields = (('fullname', 'email'),
              ('phone'),
              ('content'),
              ('ipaddr', 'flag'),
              )


admin.site.register(Menu, MenuAdmin)
admin.site.register(SubMenu, SubMenuAdmin)
admin.site.register(Base, BaseAdmin)
admin.site.register(Contact, ContactAdmin)
