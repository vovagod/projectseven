import os
import uuid
from django.db import models
from django.conf import settings
from django.utils.translation import ugettext as _


def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext


def upload_image_path(instance, filename):
    print('UPLOAD_IMAGE:{}'.format(filename))
    name, ext = get_filename_ext(filename)
    final_filename = '{name}{ext}'.format(name=name, ext=ext)
    return 'uploads/{company}/{final_filename}'.format(company=instance.slug, final_filename=final_filename)


class ClientsManager(models.Manager):
    
    def get_pk(self, email):
        print('GET_PK:{}'.format(email))
        obj = Clients.objects.get(email=email)
        return obj.uuid
    

class Clients(models.Model):
    uuid           = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False, 
                                      help_text=_("Номер UUID"))
    company        = models.CharField(max_length=120, verbose_name=_('Имя компании'))
    slug           = models.SlugField(unique=False, verbose_name=_('Слаг'), help_text=_("Слаг.."))
    address        = models.CharField(max_length=240, blank=True, verbose_name=_('Адрес компании'))
    email          = models.EmailField(max_length=120, unique=True,  verbose_name=_('Эл.почта'))
    email2         = models.EmailField(max_length=120, blank=True, null=True, verbose_name=_('Эл.почта2'))
    phone          = models.CharField(max_length=120, blank=True, verbose_name=_('Телефон'))
    about          = models.TextField(max_length=500, blank=True, verbose_name=_('О компании'))
    area           = models.CharField(max_length=120, blank=True, verbose_name=_('Сфера деятельности'))
    category       = models.CharField(max_length=30, default='HVAC', choices=settings.CATEGORIES,
                                      verbose_name=_('Категория'), help_text=_("Выберете категорию деятельности"))
    persons        = models.CharField(max_length=120, blank=True, verbose_name=_('Лица компании'))
    created        = models.DateTimeField(auto_now_add=True, verbose_name=_('Создана'))
    enable_mailing = models.BooleanField(default=True, verbose_name=_('Разрешить рассылку'))
    interested     = models.BooleanField(default=False, verbose_name=_('Клиент заинтересован'))
    counter        = models.PositiveSmallIntegerField(default=0, verbose_name=_('Счетчик  отправок'),
                                                      help_text=_("Количество оправленных писем"))
    error_mailing  = models.CharField(max_length=360, blank=True, default='Ошибок нет',
                                      verbose_name=_('Отчет об ошибке отправки'))
    file           = models.FileField(upload_to=upload_image_path, blank=True, null=True,
                                      verbose_name=_('Файл'), help_text=_("Файл данных от клиента"))
    flag           = models.BooleanField(default=False, verbose_name=_('Флаг'))

    objects = ClientsManager()


    class Meta:
        app_label = 'clients'
        #ordering = ['id']
        verbose_name = _('Клиенты')
        verbose_name_plural = _('Клиенты')


    def __str__(self):
        return self.company
    

    #def save(self):
        # make checking double mail
        #pass

