import os
from django.db import models
from django.urls import reverse
from django.conf import settings
#from django.contrib.auth.models import User
#from django.core.files import File
from django.utils.translation import ugettext as _
from collections import OrderedDict
from markdown import markdown



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


class PromotionManager(models.Manager):
    
    def obj_contents(self, category):
        #obj = OrderedDict()
        obj = [dict(promotion=b, image=b.images.all()) for b in Promotion.objects.filter(category=category)]
        #obj = {'promotion':b, 'image':b.images.all() for b in Promotion.objects.filter(category=category)}
        #obj = [{b:b.images.all()} for b in Promotion.objects.filter(category=category)]
        return dict(sorted(obj[0].items()))


class Promotion(models.Model):
    category    = models.CharField(max_length=30, default='HVAC', unique=True, choices=settings.CATEGORIES,
                                   verbose_name=_('Категория'), help_text=_("Выберете категорию деятельности"))
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
    timestamp   = models.DateTimeField(auto_now_add=True, verbose_name=_('Дата'),
                                       help_text=_("Дата/время создания контекста"))
    flag        = models.BooleanField(default=False, verbose_name=_('Флаг'),
                                      help_text=_("Флаг..")) 
    data1       = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные1'),
                                   help_text=_("Введите дополнительные данные 1"))
    data2       = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные2'),
                                   help_text=_("Введите дополнительные данные 2"))
    data3       = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные3'),
                                   help_text=_("Введите дополнительные данные 3"))
    data4       = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные4'),
                                   help_text=_("Введите дополнительные данные 4"))

    objects = PromotionManager()
    
    class Meta:
        ordering = ['id']
        verbose_name = _('Продвижение')
        verbose_name_plural = _('Продвижение')


    def save(self):
        self.desc_html = markdown(self.description)
        if not self.image:
            self.image = 'no_image.png'
        super(Promotion, self).save()
    
    
    def get_absolute_url(self):
        return 'home/'


    def get_slider_url(self):
        if self.flag:
            url = self.urllink.split('/')
            return url[-1]
        return self.urllink


    def __str__(self):
        return self.category


    
class ImageManager(models.Manager):
    
    def obj_images(self, request):
        return Image.objects.all()
    

class Image(models.Model):
    name        = models.ForeignKey(Promotion, on_delete=models.CASCADE,
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
        ordering = ['id']
        verbose_name = _('Изображения дополнительно')
        verbose_name_plural = _('Изображения дополнительно')


    def __str__(self):
        return self.title


    def save(self, *args, **kwargs):
        self.slug = Promotion.objects.get(id=self.name_id).slug
        if not self.image:
            self.image = 'no_image.png'
        super(Image, self).save(*args, **kwargs)

