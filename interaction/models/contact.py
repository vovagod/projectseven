from django.db import models
from django.utils.translation import ugettext as _
#from mysite.base.langinfo import LangInfo


class Contact(models.Model):
    fullname  = models.CharField(max_length=120, verbose_name=_('Full name'))
    email     = models.EmailField(max_length=120, verbose_name=_('Email'))
    phone     = models.CharField(max_length=120, blank=True, verbose_name=_('Phone'))
    content   = models.CharField(max_length=500, blank=True, verbose_name=_('Content'))
    subject   = models.CharField(max_length=120, blank=True, verbose_name=_('Subject of inquiry'))
    ipaddr    = models.CharField(max_length=120, blank=True, verbose_name=_('IP address'))
    timestamp = models.DateTimeField(auto_now_add=True, verbose_name=_('Date'))
    flag      = models.BooleanField(default=False, verbose_name=_('Flag'))


    class Meta:
        app_label = 'interaction'
        ordering = ['id']
        verbose_name = _('Incoming messages')
        verbose_name_plural = _('Incoming messages')


    def __str__(self):
        return self.fullname
