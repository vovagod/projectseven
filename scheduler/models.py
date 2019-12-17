from django.db import models
from django.conf import settings
from django.utils.translation import ugettext_lazy as _



class Scheduler(models.Model):
   
    id         = models.AutoField(primary_key=True)
    category   = models.CharField(max_length=30, unique=True, choices=settings.CATEGORIES, verbose_name=_('Category'),
                                  help_text=_("Select category name"))
    tick       = models.PositiveSmallIntegerField(default=0, blank=True, null=True, verbose_name=_('Ticks'),
                                                  help_text=_("Enter ticks number, 1 tick-1 hour, 0-stop"))
    counter    = models.PositiveSmallIntegerField(default=0, blank=True, null=True, verbose_name=_('Tick counter'),
                                                  help_text=_("Tick count"))
    event      = models.CharField(max_length=120, null=True, blank=True,  verbose_name=_('Status'),
                                  help_text=_("Scheduler status"))
    processing = models.CharField(max_length=120, null=True, default='None',  verbose_name=_('Processing'),
                                  help_text=_("Processing time"))

    class Meta:
        ordering = ['id']
        verbose_name = _('Scheduler')
        verbose_name_plural = _('Scheduler')


    def __str__(self):
        return self.category
   
