from django.db import models
from django.utils.translation import ugettext as _
from .contact import Contact


class Correspondence(models.Model):
    person_id = models.ForeignKey(Contact, on_delete=models.CASCADE, null=True, blank=True,
                                  verbose_name=_('ID персоны'))
    name      = models.CharField(max_length=120, verbose_name=_('Полное имя'))
    email     = models.EmailField(max_length=120, verbose_name=_('Эл.почта'))
    phone     = models.CharField(max_length=120, blank=True, verbose_name=_('Телефон'))
    content   = models.TextField(max_length=500, blank=True, verbose_name=_('Содержание письма'))
    timestamp = models.DateTimeField(auto_now_add=True, verbose_name=_('Дата'))
    flag      = models.BooleanField(default=False, verbose_name=_('Флаг'))


    class Meta:
        app_label = 'interaction'
        ordering = ['id']
        verbose_name = _('Корреспонденция')
        verbose_name_plural = _('Корреспонденция')

    def __str__(self):
        return self.name
