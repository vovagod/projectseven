import os
from django.db import models
from django.urls import reverse
from django.conf import settings
from django.utils.translation import ugettext as _
from django.http import Http404
from collections import OrderedDict
from markdown import markdown
#from mysite.base.langinfo import LangInfo



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
    
    def obj_contents(self, category, language='RU'):
        obj = [(dict(promotion=b), dict(image=b.images.all())) for b in Promotion.objects.filter(category=category, language=language)]
        try:
            obj[0]
        except IndexError:
            return None
        return obj[0]


class Promotion(models.Model):
    category    = models.CharField(max_length=30, default='HVAC', choices=settings.CATEGORIES,
                                   verbose_name=_('Category'), help_text=_("Select category"))
    language    = models.CharField(max_length=30, default='RU', choices=settings.LANG,
                                   verbose_name=_('Language'), help_text=_("Select language"))

    title       = models.CharField(max_length=120, verbose_name=_('Title'),
                                   help_text=_("Enter a title"))
    slug        = models.SlugField(unique=False, verbose_name=_('Slug'),
                                   help_text=_("Slug"))
    subtitle    = models.CharField(max_length=120, blank=True, verbose_name=_('Subtitle'),
                                   help_text=_("Enter a subtitle"))
    sentence    = models.CharField(max_length=120, blank=True, verbose_name=_('Sentence'),
                                   help_text=_("Enter a sentence"))
    description = models.TextField(verbose_name=_('Text'), help_text=_("Enter a text"))
    desc_html   = models.TextField(blank=True, editable=True)
    image       = models.ImageField(upload_to=upload_image_path, blank=True, null=True,
                                    verbose_name=_('Image'), help_text=_("Select an image"))
    filenum     = models.PositiveSmallIntegerField(default=0, verbose_name=_('File'),
                                                       help_text=_("File number"))
    urllink     = models.URLField(max_length=200, blank=True, verbose_name=_('URL link'),
                                  help_text=_("Enter URL link"))
    timestamp   = models.DateTimeField(auto_now_add=True, verbose_name=_('Date'),
                                       help_text=_("Context creation date/time"))
    flag        = models.BooleanField(default=False, verbose_name=_('Flag'),
                                      help_text=_("Flag")) 
    data1       = models.CharField(max_length=50, blank=True, verbose_name=_('Add.data1'),
                                   help_text=_("Enter additional data1"))
    data2       = models.CharField(max_length=50, blank=True, verbose_name=_('Add.data2'),
                                   help_text=_("Enter additional data2"))
    data3       = models.CharField(max_length=50, blank=True, verbose_name=_('Add.data3'),
                                   help_text=_("Enter additional data3"))
    data4       = models.CharField(max_length=50, blank=True, verbose_name=_('Add.data4'),
                                   help_text=_("Enter additional data4"))

    objects = PromotionManager()
    
    class Meta:
        ordering = ['category', 'language']
        unique_together = (('category', 'language'),)
        verbose_name = _('Promotion')
        verbose_name_plural = _('Promotion')


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
                                    verbose_name=_('Image'), help_text=_("Select an image"))
    slug        = models.SlugField(unique=False, default='imageslug', verbose_name=_('Slug'),
                                   help_text=_("Slug"))
    title       = models.CharField(max_length=120, blank=True, verbose_name=_('Title'),
                                   help_text=_("Enter a title"))
    sentence    = models.CharField(max_length=120, blank=True, verbose_name=_('Sentence'),
                                   help_text=_("Enter a sentence"))
    description = models.TextField(verbose_name=_('Text'), help_text=_("Enter a text"))
    desc_html   = models.TextField(blank=True, editable=True)

    objects = ImageManager()


    class Meta:
        ordering = ['id']
        verbose_name = _('Additional image')
        verbose_name_plural = _('Additional images')


    def __str__(self):
        return self.title


    def save(self, *args, **kwargs):
        self.slug = Promotion.objects.get(id=self.name_id).slug
        super(Image, self).save(*args, **kwargs)

