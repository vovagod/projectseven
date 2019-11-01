from django.db import models
from django.db.models.signals import post_save
from django.utils.translation import ugettext as _
from django.conf import settings
from .contact import Contact
from mail.sendmail import send_mail
from markdown import markdown



class Correspondence(models.Model):
    person_id = models.ForeignKey(Contact, on_delete=models.CASCADE, null=True, blank=True,
                                  verbose_name=_('ID персоны'))
    name         = models.CharField(max_length=120, verbose_name=_('Полное имя'))
    email        = models.EmailField(max_length=120, verbose_name=_('Эл.почта'))
    phone        = models.CharField(max_length=120, blank=True, verbose_name=_('Телефон'))
    content      = models.TextField(max_length=1000, blank=True, verbose_name=_('Содержание письма'))
    content_html = models.TextField(blank=True, editable=True)
    theme        = models.CharField(max_length=120, blank=True, verbose_name=_('Тема корреспонденции'))
    subject      = models.CharField(max_length=120, blank=True, verbose_name=_('Предмет письма'))
    feedback     = models.CharField(max_length=120, blank=True, verbose_name=_('обратная связь'))
    timestamp    = models.DateTimeField(auto_now_add=True, verbose_name=_('Дата'))
    action       = models.BooleanField(default=False, verbose_name=_('Сообщение отправлено'))
    flag         = models.BooleanField(default=False, verbose_name=_('Флаг'))


    class Meta:
        app_label = 'interaction'
        ordering = ['id']
        verbose_name = _('Отправленная корреспонденция')
        verbose_name_plural = _('Отправленная корреспонденция')


    def __str__(self):
        return self.name


    def save(self):
        print('SAVE...')
        self.content_html = markdown(self.content)
        super(Correspondence, self).save()

  
def send_email(sender, instance, **kwargs):
    print('SEND_EMAIL...')
    if not instance.action and instance.content != '':
        print('SEND_MAIL:{}'.format(instance.__dict__))
        message = {'text':instance.content_html,}
        template = 'correspondence'
        send_mail(instance.theme, instance.email, message, instance.name, template)
        Correspondence.objects.filter(id=instance.id).update(action=True)
  

post_save.connect(send_email, sender=Correspondence)
