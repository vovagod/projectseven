from django.contrib import admin

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
    #prepopulated_fields = {'slug': ('title', )}

class BaseAdmin(admin.ModelAdmin):
    list_display = ['menu', 'title','timestamp' ]
    fields = (('menu', 'title'),
              ('slug'),
              ('subtitle', 'sentence'),
              ('description'),
              #('description2'),
              #('description3'),
              ('urllink', 'filenum', 'flag'),
              ('image'),
              #('image2'),
              ('data1', 'data2', 'data3', 'data4'),
              )
    prepopulated_fields = {'slug': ('menu', )}

    inlines = [
        ImageInline,
    ]


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
