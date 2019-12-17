import os
from django.db import models
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.models import User
from django.core.files import File
from django.utils.translation import ugettext_lazy as _

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


class MenuManager(models.Manager):

    def obj_auth(self, request):
        obj = OrderedDict() # added this
        obj = {b:b.submenu_set.filter(submark=1) for b in Menu.objects.all()}
        return obj
        

class Menu(models.Model):
    title  = models.CharField(max_length=120, unique=True, verbose_name=_('Title'),
                              help_text=_("Enter menu title"))
    slug   = models.CharField(max_length=120, unique=True, verbose_name=_('Slug'),
                              help_text=_("Enter menu name in format: '#about'"))
    mark   = models.PositiveSmallIntegerField(default=0, blank=True, null=True,
                                              verbose_name=_('Mark'),
                                                       help_text=_("1-output of headers for authentic.users, 2-for unauthentic."))
    fafa   = models.CharField(max_length=50, blank=True, verbose_name=_('Icon'),
                              help_text=_("Enter icon in format: 'fa fa-cog'"))
    color  = models.CharField(max_length=50, blank=True, verbose_name=_('Color'))

    objects = MenuManager()
    

    def get_absolute_url(self):
        return '%s' % self.slug

    class Meta:
        ordering = ['id']
        verbose_name = _('Horizontal menu')
        verbose_name_plural = _('Horizontal menu')

    def __str__(self):
        return self.title


class SubMenuManager(models.Manager):
    
    def obj_contents(self, request):
        obj = [dict(submenu=b, base=b.base_set.all()) for b in SubMenu.objects.filter(subslug__startswith='#')]
        return obj
    

class SubMenu(models.Model):
    submenu  = models.ForeignKey(Menu, to_field='title', on_delete=models.CASCADE,
                                 verbose_name=_('Menu'), help_text=_("Select menu"))
    subtitle = models.CharField(max_length=120, unique=True, verbose_name=_('Submenu'),
                                help_text=_("Enter submenu title"))
    subslug  = models.CharField(max_length=120, unique=True, verbose_name=_('Slug'),
                                help_text=_("Enter submenu name in format: '#about'"))
    submark  = models.PositiveSmallIntegerField(default=0, blank=True, null=True, verbose_name=_('Submenu mark'),
                                                help_text=_("1-Submenu will be displayed"))
    subfafa  = models.CharField(max_length=50, blank=True, verbose_name=_('Submenu icon'),
                                help_text=_("Enter icon in format: 'fa fa-cog'"))
    subcolor = models.CharField(max_length=50, blank=True, verbose_name=_('color'))

    objects = SubMenuManager()
    

    def get_absolute_url(self):
        return '%s' % self.subslug

    class Meta:
        ordering = ['id']
        verbose_name = _('Vertical submenu')
        verbose_name_plural = _('Vertical submenu')

    def __str__(self):
        return self.subtitle

    

class Base(models.Model):
    menu        = models.ForeignKey(SubMenu, to_field='subtitle', on_delete=models.CASCADE,  # rename to submenu
                                        verbose_name=_('Submenu'), help_text=_("Select submenu"))
    title       = models.CharField(max_length=120, verbose_name=_('Title'),
                                       help_text=_("Enter title"))
    slug        = models.SlugField(unique=False, verbose_name=_('Slug'),
                                       help_text=_("Slug"))
    subtitle    = models.CharField(max_length=120, blank=True, verbose_name=_('Subtitle'),
                                   help_text=_("Enter subtitle"))
    sentence    = models.CharField(max_length=120, blank=True, verbose_name=_('Sentence'),
                                   help_text=_("Enter sentence"))
    description = models.TextField(verbose_name=_('Text'), help_text=_("Enter text"))
    desc_html   = models.TextField(blank=True, editable=True)
    image       = models.ImageField(upload_to=upload_image_path, blank=True, null=True,
                                    verbose_name=_('Image'), help_text=_("Select image"))
    filenum     = models.PositiveSmallIntegerField(default=0, verbose_name=_('File'),
                                                       help_text=_("File number"))
    urllink     = models.URLField(max_length=200, blank=True, verbose_name=_('URL link'),
                                  help_text=_("Enter URL link"))
    timestamp   = models.DateTimeField(auto_now_add=True, verbose_name=_('Date'), help_text=_("Date/time of cretion"))
    flag        = models.BooleanField(default=False, verbose_name=_('Flag'),
                                          help_text=_("Flag")) 
    data1       = models.CharField(max_length=50, blank=True, verbose_name=_('Add.data1'),
                                       help_text=_("Enter additional data 1"))
    data2       = models.CharField(max_length=50, blank=True, verbose_name=_('Add.data2'),
                                       help_text=_("Enter additional data 2"))
    data3       = models.CharField(max_length=50, blank=True, verbose_name=_('Add.data3'),
                                       help_text=_("Enter additional data 3"))
    data4       = models.CharField(max_length=50, blank=True, verbose_name=_('Add.data4'),
                                       help_text=_("Enter additional data 4"))
    
    class Meta:
        ordering = ['id']
        verbose_name = _('Page content')
        verbose_name_plural = _('Page content')


    def save(self):
        self.desc_html = markdown(self.description)
        if not self.image:
            self.image = 'no_image.png'
        super(Base, self).save()
    
    
    def get_absolute_url_cat(self):
        return 'home/'


    def get_slider_url(self):
        if self.flag:
            url = self.urllink.split('/')
            return url[-1]
        return self.urllink


    def __str__(self):
        return self.title


    
class ImageManager(models.Manager):
    
    def obj_images(self, request):
        return Image.objects.all()
    

class Image(models.Model):
    name        = models.ForeignKey(Base, on_delete=models.CASCADE,
                                    related_name='images', blank=True, null=True)
    image       = models.ImageField(upload_to=upload_image_path, null=True, blank=True,
                                    verbose_name=_('Image'), help_text=_("Select image"))
    slug        = models.SlugField(unique=False, default='imageslug', verbose_name=_('Slug'),
                                   help_text=_("Slug"))
    title       = models.CharField(max_length=120, blank=True, verbose_name=_('Title'),
                                   help_text=_("Enter title"))
    sentence    = models.CharField(max_length=120, blank=True, verbose_name=_('Sentence'),
                                   help_text=_("Enter sentence"))
    description = models.TextField(verbose_name=_('Text'), help_text=_("Enter text"))
    desc_html   = models.TextField(blank=True, editable=True)

    objects = ImageManager()


    class Meta:
        verbose_name = _('Additional images')
        verbose_name_plural = _('Additional images')


    def __str__(self):
        return self.title


    def save(self, *args, **kwargs):
        self.slug = Base.objects.get(id=self.name_id).slug
        if not self.image:
            self.image = 'no_image.png'
        super(Image, self).save(*args, **kwargs)

    
