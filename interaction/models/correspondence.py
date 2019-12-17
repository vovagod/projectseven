from django.db import models
from django.db.models.signals import post_save
from django.utils.translation import ugettext_lazy as _
from django.conf import settings

from .contact import Contact
from mail.sendmail import send_mail
from markdown import markdown



class Correspondence(models.Model):
    person_id = models.ForeignKey(Contact, on_delete=models.CASCADE, null=True, blank=True,
                                  verbose_name=_('Person ID'))
    name         = models.CharField(max_length=120, verbose_name=_('Full name'))
    email        = models.EmailField(max_length=120, verbose_name=_('Email'))
    phone        = models.CharField(max_length=120, blank=True, verbose_name=_('Phone'))
    content      = models.TextField(max_length=1000, blank=True, verbose_name=_('Letter content'))
    content_html = models.TextField(blank=True, editable=True)
    theme        = models.CharField(max_length=120, blank=True, verbose_name=_('Letter theme'))
    subject      = models.CharField(max_length=120, blank=True, verbose_name=_('Letter subject'))
    feedback     = models.CharField(max_length=120, blank=True, verbose_name=_('Feedback'))
    timestamp    = models.DateTimeField(auto_now_add=True, verbose_name=_('Date'))
    action       = models.BooleanField(default=False, verbose_name=_('Message sent'))
    flag         = models.BooleanField(default=False, verbose_name=_('Flag'))


    class Meta:
        app_label = 'interaction'
        ordering = ['id']
        verbose_name = _('Forwarded correspondence')
        verbose_name_plural = _('Forwarded correspondence')


    def __str__(self):
        return self.name


    def save(self):
        self.content_html = markdown(self.content)
        super(Correspondence, self).save()

  
def send_email(sender, instance, **kwargs):
    if not instance.action and instance.content != '':
        message = {'text':instance.content_html,}
        template = 'correspondence'
        send_mail(instance.theme, instance.email, message, instance.name, template)
        Correspondence.objects.filter(id=instance.id).update(action=True)
  

post_save.connect(send_email, sender=Correspondence)
