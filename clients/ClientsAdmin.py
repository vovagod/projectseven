import os
import sys
import glob
from django.contrib import admin
from django.contrib import messages
from django.shortcuts import redirect
from django.conf import settings
from django.urls import reverse_lazy
from django.utils.translation import ugettext_lazy as _
from django.utils.html import format_html_join, format_html
from django_object_actions import DjangoObjectActions
from .models import Clients
from promotion.models import Promotion
from mail.sendmail import send_mail



class ClientsAdmin(DjangoObjectActions, admin.ModelAdmin):
    list_display = ['company', 'category', 'language', 'email', 'phone',
                    'enable_mailing', 'interested', 'preorder', 'errors']

    search_fields = ('company', 'category',)

    readonly_fields = (
        'company_created',
        'uuid',
        'theme_of_mailing',
        'downloaded_files',
        'mailing_errors',
        'path_to_folder',
    )
    

    fieldsets = (
        (_('Client'), {
            'fields': (
                ('category', 'language'),
                ('uuid'),
                ('company', 'slug'),
                ('email', 'phone'),
            )
        }),
        (_('Description'), {
            'fields': (
                'about',
                ('company_created', 'enable_mailing', 'interested', 'preorder', 'flag'),
            ),
        }),
        (_('Actions'), {
            'fields': (
                ('counter', 'file'),
                'mailing_errors',
                'path_to_folder',
                'downloaded_files',
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
        subject = settings.SUBJECT_MAIL.get(obj.category,)
        template = settings.TEMPLATE_MAIL.get(obj.category,)
        
        message = Promotion.objects.obj_contents(obj.category, obj.language)
        if message is None:
            messages.error(request, _('Promotion on this language does not exist'))
        else:
            err = send_mail(subject, obj.email, message, obj.company, template, obj.language)
            if err:
                messages.error(request, _('There was an error sending an email: '))
                messages.add_message(request, messages.ERROR, str(err)[1:-2])
            else:
                Clients.objects.filter(uuid=obj.uuid).update(counter=obj.counter+1)
                messages.info(request, _("Message was successfully sent to client"))
        return redirect(reverse_lazy('admin:clients_clients_change', args=[obj.uuid,]))
    
    send_to_client.label = _("Send message to client")  
    send_to_client.short_description = _("Submit message")  

    change_actions = ('send_to_client', )


    def company_created(self, instance):
        return format_html("<b>{}</b>",
                           '{}'.format(instance.get_date())
                           )
    

    def theme_of_mailing(self, instance):
        return format_html("<b>{}</b>",
                           '{}'.format(instance.get_theme())
                           )
                           
    theme_of_mailing.short_description = _("theme of mailing")


    def mailing_errors(self, instance):
        return format_html("<b>{}</b>",
                           '{}'.format(instance.get_errors() or _('None'))
                           )
                           
    mailing_errors.short_description = _("mailing errors")


    def errors(self, obj):
        if obj.error_mailing == 'None':
            return ("%s" % _('None'))
        else:
            return ("%s" % _('Available'))
        
    errors.short_description = _('Errors')
    

    def path_to_folder(self, instance):
        return format_html("<b>{}</b>",
                           '{}'.format(instance.get_filepath() or _('None'))
                           )
                           
    path_to_folder.short_description = _("path to folder")


    def downloaded_files(self, instance):
        path = instance.get_filepath()
        if not path:
            return format_html('<b>{}</b>'.format(_('None')))
        return format_html_join('\n', '&emsp;<a href="http://{}{}" title="{}" onclick="return !window.open(this.href)" download>{}</a>',
                           ((settings.DOMAIN,
                             f[len(settings.MEDIA_ROOT):],
                             _('Download file'),
                             f.strip('/').split('/')[-1],
                             ) for f in glob.glob(path+"*.*"))
                           )
                           
    downloaded_files.short_description = _("List of downloaded files")  



def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
