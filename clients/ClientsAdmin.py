import os
import sys
import glob
from django.contrib import admin
from django.contrib import messages
from django.shortcuts import redirect
from django.conf import settings
from django.urls import reverse_lazy
from django.utils.translation import ugettext_lazy as _
from django.utils import translation
from django.utils.html import format_html_join, format_html

from django_object_actions import DjangoObjectActions
from .models import Clients, ImportDuplication
from promotion.models import Promotion
from scheduler.models import Scheduler
from mail.sendmail import send_mail
from import_export import fields, resources
from import_export.admin import ImportExportMixin



def set_counter(self, request, queryset):
    
    for query in queryset:
        initial_tick = Scheduler.objects.get(category=query.category)
        queryset.filter(uuid=query.uuid).update(counter=initial_tick.counter)
       
    messages.info(request, _("Counters of selected clients were updated"))

set_counter.short_description = _("Set counters to initial")


class ClientsResource(resources.ModelResource):

    class Meta:
        model = Clients
        fields = ('company', 'address', 'country', 'area', 'email', 'email2', 'phone', 'about',
                  'category', 'language', 'persons', 'enable_mailing',
                  )


class ClientsAdmin(ImportExportMixin, DjangoObjectActions, admin.ModelAdmin):
    resource_class = ClientsResource
    list_display = ['company', 'country', 'area', 'category', 'language', 'count',
                    'counter', 'enable_mailing', 'interested', 'preorder', 'errors']
    
    actions = [set_counter]

    search_fields = ('company', 'about',)
    list_filter = ('category', 'country', 'area', 'enable_mailing', 'preorder')

    readonly_fields = (
        'company_created',
        'uuid',
        'theme_of_mailing',
        'downloaded_files',
        'mailing_errors',
        'path_to_folder',
        'last_post',
        'emails_sent',
    )
    
    fieldsets = (
        (_('Client'), {
            'fields': (
                ('category', 'language'),
                ('country', 'area'),
                ('company', 'slug'),
                ('address', 'uuid'),
                ('email', 'phone'),
            )
        }),
        (_('Description'), {
            'fields': (
                'about',
                ('company_created', 'enable_mailing', 'interested', 'preorder', 'flag'),
                'bid',
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
                'last_post',
                'emails_sent',
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
                messages.error(request, _('There was an error sending the email: '))
                messages.add_message(request, messages.ERROR, str(err)[1:-2])
            else:
                Clients.objects.filter(uuid=obj.uuid).update(count=obj.count+1)
                messages.info(request, _("Message was successfully sent to client"))
        translation.deactivate()
        return redirect(reverse_lazy('admin:clients_clients_change', args=[obj.uuid,]))
   
    send_to_client.label = _("Send promotion to client")  
    send_to_client.short_description = _("Submit message")  

    change_actions = ('send_to_client', )


    def company_created(self, instance):
        return format_html("<b>{}</b>",
                           '{}'.format(instance.get_date(instance.created))
                           )
    
    company_created.short_description = _("company created")


    def last_post(self, instance):
        return format_html("<b>{}</b>",
                           '{}'.format(instance.get_date(instance.last_post))
                           )
    
    last_post.short_description = _("last post")
    

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


    def emails_sent(self, instance):
        return format_html("<b>{}</b>",
                           '{}'.format(instance.get_count())
                           )
                           
    emails_sent.short_description = _("number of emails sent")


    def errors(self, obj):
        if obj.error_mailing == '':
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


    def has_module_permission(self, request):
        if translation.get_language_from_request(request, check_path=True) != settings.LANGUAGE_CODE:
            return False
        return True


class ImportDuplicationAdmin(admin.ModelAdmin):
    
    list_display = ['id', 'company', 'cause', 'created', 'flag']

    readonly_fields = (
        'id',
        'company',
        'cause',
        'created',
    )

    def has_module_permission(self, request):
        if translation.get_language_from_request(request, check_path=True) != settings.LANGUAGE_CODE:
            return False
        return True

    

def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
