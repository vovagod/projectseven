from django.db import models
from django.conf import settings
from django.utils.translation import ugettext as _



class Scheduler(models.Model):

    #CATEGORIES = settings.CATEGORIES
    #CATEGORIES = (
    #('server', 'Server'),
    #('facebook', 'Facebook'),
    #('mathematics', 'Mathematics'),
    #)
    
   
    id       = models.AutoField(primary_key=True)
    category = models.CharField(max_length=30, unique=True, choices=settings.CATEGORIES, verbose_name=_('Категория рассылки'),
                                help_text=_("Выберете название категории"))
    tick     = models.PositiveSmallIntegerField(default=0, blank=True, null=True, verbose_name=_('Количество тиков'),
                                               help_text=_("Введите количесво тиков, 1 тик равен 1 часу"))
    counter  = models.PositiveSmallIntegerField(default=0, blank=True, null=True, verbose_name=_('Счетчик тиков'),
                                               help_text=_("Подсчет тиков"))

    class Meta:
        ordering = ['id']
        verbose_name = _('Планировщик')
        verbose_name_plural = _('Планировщик')


    def __str__(self):
        return self.category
   
