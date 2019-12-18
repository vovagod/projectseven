import os
from django.db import models
from django.urls import reverse
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from django.http import Http404

from mysite.common.models import CommonImage, CommonBase
from collections import OrderedDict
from markdown import markdown



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


class Promotion(CommonBase):
    
    category    = models.CharField(max_length=30, default='HVAC', choices=settings.CATEGORIES,
                                   verbose_name=_('Category'), help_text=_("Select category"))
    language    = models.CharField(max_length=30, default='RU', choices=settings.LANG,
                                   verbose_name=_('Language'), help_text=_("Select language"))


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
    

class Image(CommonImage):
    
    name        = models.ForeignKey(Promotion, on_delete=models.CASCADE,
                                    related_name='images', blank=True, null=True)

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

