import os
from django.db import models
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.models import User
from django.core.files import File
from django.utils.translation import ugettext_lazy as _

from mysite.common.models import CommonImage, CommonBase
from collections import OrderedDict
from markdown import markdown



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

    

class Base(CommonBase):
    
    menu        = models.ForeignKey(SubMenu, to_field='subtitle', on_delete=models.CASCADE,  # rename to submenu
                                    verbose_name=_('Submenu'), help_text=_("Select submenu"))
    
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
    

class Image(CommonImage):

    name        = models.ForeignKey(Base, on_delete=models.CASCADE,
                                    related_name='images', blank=True, null=True)

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

    
