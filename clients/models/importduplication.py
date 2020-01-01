from django.db import models
from django.utils.translation import ugettext_lazy as _


class ImportDuplication(models.Model):
     company  = models.CharField(max_length=120, blank=True, default='', verbose_name=_('Company name'))
     cause    = models.TextField(max_length=500, blank=True, default='',
                                 verbose_name=_('Cause of Import Duplication'))
     created  = models.DateTimeField(auto_now_add=True, verbose_name=_('Created'))
     flag     = models.BooleanField(default=False, verbose_name=_('Flag'))


     class Meta:
        app_label = 'clients'
        verbose_name = _('ImportDuplication')
        verbose_name_plural = _('ImportDuplication')
        ordering = ['created']

    
