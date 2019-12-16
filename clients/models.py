import os
import glob
import uuid
import locale
from django.db import models
from django.conf import settings
from django.utils.translation import ugettext as _
#from mysite.base.langinfo import LangInfo



def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext


def upload_image_path(instance, filename):
    name, ext = get_filename_ext(filename)
    final_filename = '{name}{ext}'.format(name=name, ext=ext)
    return 'uploads/{company}/{final_filename}'.format(company=instance.slug, final_filename=final_filename)


class ClientsManager(models.Manager):
    
    def get_pk(self, email):
        obj = Clients.objects.get(email=email)
        return obj.uuid
    

class Clients(models.Model):
    uuid           = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False, 
                                      help_text=_("UUID Number"))
    company        = models.CharField(max_length=120, verbose_name=_('Company name'))
    slug           = models.SlugField(unique=False, verbose_name=_('Slug'), help_text=_("Slug"))
    address        = models.CharField(max_length=240, blank=True, verbose_name=_('Company address'))
    email          = models.EmailField(max_length=120, unique=True,  verbose_name=_('Company email'))
    email2         = models.EmailField(max_length=120, blank=True, null=True, verbose_name=_('Contact email'))
    phone          = models.CharField(max_length=120, blank=True, verbose_name=_('Phone'))
    about          = models.TextField(max_length=500, blank=True, verbose_name=_('About company'))
    area           = models.CharField(max_length=120, blank=True, verbose_name=_('Field of activity'))
    category       = models.CharField(max_length=30, default='HVAC', choices=settings.CATEGORIES,
                                      verbose_name=_('Category'), help_text=_("Select category"))
    language       = models.CharField(max_length=30, default='RU', choices=settings.LANG,
                                      verbose_name=_('Language'), help_text=_("Select language"))
    persons        = models.CharField(max_length=120, blank=True, verbose_name=_('Company persons'))
    created        = models.DateTimeField(auto_now_add=True, verbose_name=_('Created'))
    last_post      = models.DateTimeField(blank=True, null=True, verbose_name=_('Last post'))
    enable_mailing = models.BooleanField(default=True, verbose_name=_('Emailing'))
    interested     = models.BooleanField(default=False, verbose_name=_('Interest'))
    preorder       = models.BooleanField(default=False, verbose_name=_('Preorder'))
    counter        = models.PositiveSmallIntegerField(default=0, verbose_name=_('Email counter'),
                                                      help_text=_("Number of email sent"))
    error_mailing  = models.CharField(max_length=360, blank=True, default='None',
                                      verbose_name=_('Emailing report'))
    file           = models.FileField(upload_to=upload_image_path, blank=True, null=True,
                                      verbose_name=_('File'), help_text=_("File from client"))
    filepath       = models.CharField(max_length=120, blank=True, verbose_name=_('Path to downloaded files'))
    flag           = models.BooleanField(default=False, verbose_name=_('Flag'))

    objects = ClientsManager()


    class Meta:
        app_label = 'clients'
        verbose_name = _('Clients')
        verbose_name_plural = _('Clients')


    def __str__(self):
        return self.company

    # get theme of mailing
    def get_theme(self):
        return self.category

    # get path of file
    def get_filepath(self):
        return self.filepath

    # get errors when mailing
    def get_errors(self):
        return self.error_mailing

    # get date of creation/last_post
    def get_date(self, obj):
        locale.setlocale(locale.LC_ALL, '')
        return obj.strftime("%d %B %Y")


