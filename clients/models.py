from django.db import models
from django.conf import settings
from django.utils.translation import ugettext as _


class Clients(models.Model):
    company        = models.CharField(max_length=120, verbose_name=_('Имя компании'))
    email          = models.EmailField(max_length=120, verbose_name=_('Эл.почта'))
    phone          = models.CharField(max_length=120, blank=True, verbose_name=_('Телефон'))
    about          = models.TextField(max_length=500, blank=True, verbose_name=_('О компании'))
    area           = models.CharField(max_length=120, blank=True, verbose_name=_('Сфера деятельности'))
    category       = models.CharField(max_length=30, default='HVAC', choices=settings.CATEGORIES,
                                      verbose_name=_('Категория'), help_text=_("Выберете категорию деятельности"))
    persons        = models.CharField(max_length=120, blank=True, verbose_name=_('Лица компании'))
    created        = models.DateTimeField(auto_now_add=True, verbose_name=_('Создана'))
    enable_mailing = models.BooleanField(default=True, verbose_name=_('Разрешить рассылку'))
    interested     = models.BooleanField(default=False, verbose_name=_('Клиент заинтересован'))
    flag           = models.BooleanField(default=False, verbose_name=_('Флаг'))
    

    class Meta:
        app_label = 'clients'
        ordering = ['id']
        verbose_name = _('Клиенты')
        verbose_name_plural = _('Клиенты')


    def __str__(self):
        return self.company

