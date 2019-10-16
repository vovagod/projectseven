import os
#import urllib 
from django.db import models
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.models import User
#from django.core.files import File
#from django.core.files.base import ContentFile
from django.core.files import File
from django.utils.translation import ugettext as _
from collections import OrderedDict
from markdown import markdown

#from django.dispatch import receiver
#from django.db.models.signals import pre_save, post_save
#from django.core.exceptions import ValidationError



def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext


def upload_image_path(instance, filename):
    name, ext = get_filename_ext(filename)
    final_filename = '{name}{ext}'.format(name=name, ext=ext)
    return '{category}/{final_filename}'.format(category=instance.slug, final_filename=final_filename)


def default_image_path():
    return '{}/no_image.png'.format(settings.MEDIA_ROOT)
    

class MenuManager(models.Manager):

    def obj_auth(self, request):
        obj = {b:b.submenu_set.filter(submark=1) for b in Menu.objects.all()}
        return obj
        

class Menu(models.Model):
    title  = models.CharField(max_length=120, unique=True, verbose_name=_('Заголовок'),
                              help_text=_("Введите название раздела меню"))
    slug   = models.CharField(max_length=120, unique=True, verbose_name=_('Слаг'),
                              help_text=_("Введите раздел меню латинницей в формате: '#about'"))
    mark   = models.PositiveSmallIntegerField(default=0, blank=True, null=True,
                                              verbose_name=_('Метка'),
                                                       help_text=_("1-вывод заголовков для аутентиф. пользователей, 2-для неаутентиф."))
    fafa   = models.CharField(max_length=50, blank=True, verbose_name=_('Иконка'),
                              help_text=_("Ввод иконки в формате 'fa fa-cog'"))
    color  = models.CharField(max_length=50, blank=True, verbose_name=_('Цвет'))

    objects = MenuManager()
    

    def get_absolute_url(self):
        return '%s' % self.slug

    class Meta:
        ordering = ['id']
        verbose_name = _('Горизонтальное меню')
        verbose_name_plural = _('Горизонтальное меню')

    def __str__(self):
        return self.title


class SubMenuManager(models.Manager):
    
    def obj_contents(self, request):
        obj = [dict(submenu=b, base=b.base_set.all()) for b in SubMenu.objects.filter(subslug__startswith='#')]
        #print ('OBJ:{}'.format(obj))
        return obj
    

class SubMenu(models.Model):
    submenu  = models.ForeignKey(Menu, to_field='title', on_delete=models.CASCADE,
                                 verbose_name=_('Меню'), help_text=_("Выберете раздел меню"))
    subtitle = models.CharField(max_length=120, unique=True, verbose_name=_('Подменю'),
                                help_text=_("Введите название раздела подменю"))
    subslug  = models.CharField(max_length=120, unique=True, verbose_name=_('Слаг'),
                                help_text=_("Введите подменю латинницей в формате: '#about'"))
    submark  = models.PositiveSmallIntegerField(default=0, blank=True, null=True, verbose_name=_('Метка подменю'),
                                                help_text=_("1-подменю будет выведено"))
    subfafa  = models.CharField(max_length=50, blank=True, verbose_name=_('Иконка подменю'),
                                help_text=_("Ввод иконки в формате 'fa fa-cog'"))
    subcolor = models.CharField(max_length=50, blank=True, verbose_name=_('Цвет'))

    objects = SubMenuManager()
    

    def get_absolute_url(self):
        return '%s' % self.subslug

    class Meta:
        ordering = ['id']
        verbose_name = _('Вертикальное подменю')
        verbose_name_plural = _('Вертикальное подменю')

    def __str__(self):
        return self.subtitle

    

class Base(models.Model):
    menu        = models.ForeignKey(SubMenu, to_field='subtitle', on_delete=models.CASCADE,  # rename to submenu
                                        verbose_name=_('Подменю'), help_text=_("Выберете раздел подменю"))
    title       = models.CharField(max_length=120, verbose_name=_('Заголовок'),
                                       help_text=_("Введите заголовок контекста"))
    slug        = models.SlugField(unique=False, verbose_name=_('Слаг'),
                                       help_text=_("Слаг.."))
    subtitle    = models.CharField(max_length=120, blank=True, verbose_name=_('Подзаголовок'),
                                   help_text=_("Введите подзаголовок контекста"))
    sentence    = models.CharField(max_length=120, blank=True, verbose_name=_('Предложение'),
                                   help_text=_("Введите предложение"))
    description = models.TextField(verbose_name=_('Текст'), help_text=_("Введите текст"))
    desc_html   = models.TextField(blank=True, editable=True)
    image       = models.ImageField(upload_to=upload_image_path, blank=True, null=True,
                                    verbose_name=_('Изображение'), help_text=_("Выберете изображение"))
    filenum     = models.PositiveSmallIntegerField(default=0, verbose_name=_('Файл'),
                                                       help_text=_("Номер файла"))
    urllink     = models.URLField(max_length=200, blank=True, verbose_name=_('Ссылка'),
                                  help_text=_("Введите ссылку на ресурс"))
    timestamp   = models.DateTimeField(auto_now_add=True, verbose_name=_('Дата'), help_text=_("Дата/время создания контекста"))
    flag        = models.BooleanField(default=False, verbose_name=_('Флаг'),
                                          help_text=_("Флаг..")) # User Library
    data1       = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные1'),
                                       help_text=_("Введите дополнительные данные 1"))
    data2       = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные2'),
                                       help_text=_("Введите дополнительные данные 2"))
    data3       = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные3'),
                                       help_text=_("Введите дополнительные данные 3"))
    data4       = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные4'),
                                       help_text=_("Введите дополнительные данные 4"))
    
    class Meta:
        ordering = ['id']
        verbose_name = _('Содержание страницы')
        verbose_name_plural = _('Содержание страницы')


    def save(self):
        print('SAVE FUNCTION')
        self.desc_html = markdown(self.description)
        if not self.image:
            self.image = 'no_image.png'
        super(Base, self).save()

    #def clean_url(self):
        #print('CLEAN FUNCTION')
        #if self.cleaned_data["urllink"] is None:
            #raise forms.ValidationError(u"You need set some urllink.")

    #def full_clean(self, exclude=None, validate_unique=True):
        #print('CLEAN FIELDS:{}'.format(self.__dict__))
        #pass
    
    
    def get_absolute_url_cat(self):
        return 'home/'


    def get_slider_url(self):
        if self.flag:
            url = self.urllink.split('/')
            #print('URL:{}'.format(url[-1]))
            return url[-1]
        return self.urllink


    def __str__(self):
        return self.title

#@receiver(pre_save)
#def pre_save_handler(sender, instance, *args, **kwargs):
    #print('INSTANCE:{}'.format(instance.__dict__))
    #instance.full_clean()

#def base_presave(sender, instance, **kwargs):
    #print('INSTANCE:{}'.format(instance.__dict__))
    #return

#pre_save.connect(base_presave, sender=Base)

    
class ImageManager(models.Manager):
    
    def obj_images(self, request):
        return Image.objects.all()
    

class Image(models.Model):
    name        = models.ForeignKey(Base, on_delete=models.CASCADE,
                                    related_name='images', blank=True, null=True)
    image       = models.ImageField(upload_to=upload_image_path, null=True, blank=True,
                                    verbose_name=_('Изображение'), help_text=_("Выберете изображение"))
    slug        = models.SlugField(unique=False, default='imageslug', verbose_name=_('Слаг'),
                                   help_text=_("Слаг.."))
    title       = models.CharField(max_length=120, blank=True, verbose_name=_('Заголовок'),
                                   help_text=_("Введите заголовок"))
    sentence    = models.CharField(max_length=120, blank=True, verbose_name=_('Предложение'),
                                   help_text=_("Введите предложение"))
    description = models.TextField(verbose_name=_('Текст'), help_text=_("Введите текст"))
    desc_html   = models.TextField(blank=True, editable=True)

    objects = ImageManager()


    class Meta:
        verbose_name = _('Изображения дополнительно')
        verbose_name_plural = _('Изображения дополнительно')


    def __str__(self):
        return self.title


    def save(self, *args, **kwargs):
        print('DESC_HTML:{}'.format(self.desc_html))
        self.slug = Base.objects.get(id=self.name_id).slug
        if not self.image:
            self.image = 'no_image.png'
        #print('IMAGE_SLUG:{}'.format(self.slug))
        super(Image, self).save(*args, **kwargs)
    
    

class Contact(models.Model):
    fullname    = models.CharField(max_length=120, verbose_name=_('Полное имя'))
    email       = models.EmailField(max_length=120, verbose_name=_('Эл.почта'))
    phone       = models.CharField(max_length=120, blank=True, verbose_name=_('Телефон'))
    content     = models.CharField(max_length=500, blank=True, verbose_name=_('Содержание'))
    ipaddr      = models.CharField(max_length=120, blank=True, verbose_name=_('IP адрес'))
    timestamp   = models.DateTimeField(auto_now_add=True, verbose_name=_('Дата'))
    flag        = models.BooleanField(default=False, verbose_name=_('Флаг'))


    class Meta:
        ordering = ['id']
        verbose_name = _('Сообщения')
        verbose_name_plural = _('Сообщения')

    

