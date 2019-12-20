import os
from django.db import models
from django.utils.translation import ugettext_lazy as _


def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext


def upload_image_path(instance, filename):
    name, ext = get_filename_ext(filename)
    final_filename = '{name}{ext}'.format(name=name, ext=ext)
    return '{category}/{final_filename}'.format(category=instance.slug, final_filename=final_filename)



class CommonImage(models.Model):
   
    image       = models.ImageField(upload_to=upload_image_path, null=True, blank=True,
                                    verbose_name=_('Image'), help_text=_("Select an image"))
    slug        = models.SlugField(unique=False, default='imageslug', verbose_name=_('Slug'),
                                   help_text=_("Slug"))
    title       = models.CharField(max_length=120, blank=True, verbose_name=_('Title'),
                                   help_text=_("Enter a title"))
    sentence    = models.CharField(max_length=120, blank=True, verbose_name=_('Sentence'),
                                   help_text=_("Enter a sentence"))
    urllink     = models.URLField(max_length=200, blank=True, verbose_name=_('URL link'),
                                  help_text=_("Enter URL link"))
    description = models.TextField(verbose_name=_('Text'), help_text=_("Enter a text"))
    desc_html   = models.TextField(blank=True, editable=True)


    class Meta:
        abstract = True

        

class CommonBase(models.Model):

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
        abstract = True
