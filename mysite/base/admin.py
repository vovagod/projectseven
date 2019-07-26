from django.contrib import admin

from .models import Base, Menu, SubMenu, Contact

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


class BaseAdmin(admin.ModelAdmin):
    list_display = ['title','timestamp' ]
    fields = (('menu', 'title'),
              ('slug'),
              ('subtitle', 'sentence'),
              ('description'),
              #('urlpath'),
              ('urllink', 'filenum', 'flag'),
              ('image')
              )
    prepopulated_fields = {'slug': ('title', )}


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
