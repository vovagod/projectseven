from django.db import models
from django.utils.translation import ugettext as _


class Contact(models.Model):
    fullname  = models.CharField(max_length=120, verbose_name=_('Полное имя'))
    email     = models.EmailField(max_length=120, verbose_name=_('Эл.почта'))
    phone     = models.CharField(max_length=120, blank=True, verbose_name=_('Телефон'))
    content   = models.CharField(max_length=500, blank=True, verbose_name=_('Содержание'))
    subject   = models.CharField(max_length=120, blank=True, verbose_name=_('Предмет запроса'))
    ipaddr    = models.CharField(max_length=120, blank=True, verbose_name=_('IP адрес'))
    timestamp = models.DateTimeField(auto_now_add=True, verbose_name=_('Дата'))
    flag      = models.BooleanField(default=False, verbose_name=_('Флаг'))


    class Meta:
        app_label = 'interaction'
        ordering = ['id']
        verbose_name = _('Входящие сообщения')
        verbose_name_plural = _('Входящие сообщения')


    def __str__(self):
        return self.fullname
