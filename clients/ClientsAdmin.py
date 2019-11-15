import sys
import glob
from django.contrib import admin
from django.contrib import messages
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.utils.translation import ugettext_lazy as _
from django.utils.html import format_html_join, format_html
from django_object_actions import DjangoObjectActions
from .models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail



class ClientsAdmin(DjangoObjectActions, admin.ModelAdmin):
    list_display = ['company', 'category', 'email', 'phone', 'enable_mailing',]

    search_fields = ('company', 'category',)

    readonly_fields = (
        'created',
        'uuid',
        'theme_of_mailing',
    )
    

    fieldsets = (
        (_('Client'), {
            'fields': (
                ('category', 'uuid'),
                ('company', 'slug'),
                ('email', 'phone'),
            )
        }),
        (_('Description'), {
            'fields': (
                'about',
                ('created', 'enable_mailing', 'interested', 'flag'),
            ),
        }),
        (_('Actions'), {
            'fields': (
                ('counter', 'file', 'error_mailing'),
                'filepath',
            ),
        }),
        (_('Mailing'), {
            'fields': (
                'theme_of_mailing', 
            ),
        }),
        )

    prepopulated_fields = {'slug': ('company', )}


    def send_to_client(self, request, obj):
        subject = 'Business proposition'
        template = 'proposition'
        message = Promotion.objects.obj_contents(obj.category)
        send_mail(subject, obj.email, message, obj.company, template)
        messages.info(request, _("Send message to client"))
        return redirect(reverse_lazy('admin:clients_clients_change', args=[obj.uuid,]))

    send_to_client.label = "Send message to client"  # optional
    send_to_client.short_description = "Submit message"  # optional

    change_actions = ('send_to_client', )


    def theme_of_mailing(self, instance):
        return format_html("<b>{}</b>",
                           '{}'.format(instance.get_theme())
                           )
                           
    theme_of_mailing.short_description = _("theme of mailing")


    #def downloaded_files(self, instance):
        #return format_html("<b>{}</b>",
                           #'{}'.format(instance.get_theme())
                           #)
    #for file in glob.glob(path + "*.*"):
                #print('FILEPATH:{}'.format(file))
    #<a href="path_to_file" download="proposed_file_name">Download</a>
                           
    #downloaded_files.short_description = _("list of downloaded files")
  


def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
