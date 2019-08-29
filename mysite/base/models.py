import os
from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User
from django.utils.translation import ugettext as _
from collections import OrderedDict
from markdown import markdown



def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext


def upload_image_path(instance, filename):
    #catslug = Base.objects.filter(title=instance.category)
    #print('Upload_instance_title:{}'.format(catslug[0].slug))
    #print('Upload_filename:{}'.format(filename))
    file_num = instance.filenum + 1
    Base.objects.update(filenum=file_num)
    #file_num = instance.filenum + 1
    name, ext = get_filename_ext(filename)
    final_filename = '{name}{file_num}{ext}'.format(name=name, file_num=file_num, ext=ext)
    return '{category}/{final_filename}'.format(category=instance.slug,
                                                final_filename=final_filename)

class MenuManager(models.Manager):

    def obj_auth(self, request):
        obj = {b:b.submenu_set.filter(submark=1) for b in Menu.objects.all()}
        return obj
        


class Menu(models.Model):
    title           = models.CharField(max_length=120, unique=True, verbose_name=_('Заголовок'),
                                       help_text=_("Введите название раздела меню"))
    slug            = models.CharField(max_length=120, unique=True, verbose_name=_('Слаг'),
                                       help_text=_("Введите раздел меню латинницей в формате: 'about', 'products/all'"))
    mark            = models.PositiveSmallIntegerField(default=0, blank=True, null=True,
                                                       verbose_name=_('Метка'),
                                                       help_text=_("1-вывод заголовков для аутентиф. пользователей, 2-для неаутентиф."))
    fafa            = models.CharField(max_length=50, blank=True, verbose_name=_('Иконка'),
                                       help_text=_("Ввод иконки в формате 'fa fa-cog'"))
    color           = models.CharField(max_length=50, blank=True, verbose_name=_('Цвет'))

    objects = MenuManager()
    

    def get_absolute_url(self):
        return '/%s' % self.slug

    class Meta:
        ordering = ['id']
        verbose_name = _('Горизонтальное меню')
        verbose_name_plural = _('Горизонтальное меню')

    def __str__(self):
        return self.title


class SubMenuManager(models.Manager):
    
    def obj_contents(self, request):
        obj = [dict(submenu=b, base=b.base_set.all()) for b in SubMenu.objects.filter(subslug__startswith='#')]
        return obj
    

class SubMenu(models.Model):
    submenu            = models.ForeignKey(Menu, to_field='title', on_delete=models.CASCADE,
                                           verbose_name=_('Меню'), help_text=_("Выберете раздел меню"))
    subtitle           = models.CharField(max_length=120, unique=True, verbose_name=_('Подменю'),
                                          help_text=_("Введите название раздела подменю"))
    subslug            = models.CharField(max_length=120, unique=True, verbose_name=_('Слаг'),
                                          help_text=_("Введите подменю латинницей в формате: '#about'"))
    submark            = models.PositiveSmallIntegerField(default=0, blank=True, null=True,
                                                          verbose_name=_('Метка подменю'),
                                                          help_text=_("1-подменю будет выведено"))
    subfafa            = models.CharField(max_length=50, blank=True, verbose_name=_('Иконка подменю'),
                                          help_text=_("Ввод иконки в формате 'fa fa-cog'"))
    subcolor           = models.CharField(max_length=50, blank=True, verbose_name=_('Цвет'))

    objects = SubMenuManager()
    

    def get_absolute_url(self):
        return '/%s' % self.subslug

    class Meta:
        ordering = ['submenu_id']
        verbose_name = _('Вертикальное подменю')
        verbose_name_plural = _('Вертикальное подменю')

    def __str__(self):
        return self.subtitle
    


class Base(models.Model):
    menu            = models.ForeignKey(SubMenu, to_field='subtitle', on_delete=models.CASCADE,  # rename to submenu
                                        verbose_name=_('Подменю'), help_text=_("Выберете раздел подменю"))
    title           = models.CharField(max_length=120, verbose_name=_('Заголовок'),
                                       help_text=_("Введите заголовок контекста"))
    slug            = models.SlugField(unique=False, verbose_name=_('Слаг'),
                                       help_text=_("Слаг.."))
    subtitle        = models.CharField(max_length=120, blank=True, verbose_name=_('Подзаголовок'),
                                       help_text=_("Введите подзаголовок контекста"))
    sentence        = models.CharField(max_length=120, blank=True, verbose_name=_('Предложение'),
                                       help_text=_("Введите предложение"))
    description     = models.TextField(verbose_name=_('Текст'), help_text=_("Введите текст"))
    description2    = models.TextField(blank=True, verbose_name=_('Текст2'), help_text=_("Введите текст2"))
    description3    = models.TextField(blank=True, verbose_name=_('Текст3'), help_text=_("Введите текст3"))
    desc_html       = models.TextField(blank=True, editable=True)
    image           = models.ImageField(upload_to=upload_image_path, null=True, blank=True,
                                        verbose_name=_('Изображение'), help_text=_("Выберете изображение"))
    image2          = models.ImageField(upload_to=upload_image_path, null=True, blank=True,
                                        verbose_name=_('Изображение2'), help_text=_("Выберете изображение2"))
    filenum         = models.PositiveSmallIntegerField(default=0, verbose_name=_('Файл'),
                                                       help_text=_("Номер файла"))
    urllink         = models.URLField(max_length=200, blank=True, verbose_name=_('Ссылка'),
                                      help_text=_("Введите ссылку на ресурс"))
    timestamp       = models.DateTimeField(auto_now_add=True, verbose_name=_('Дата'), help_text=_("Дата/время создания контекста"))
    flag            = models.BooleanField(default=False, verbose_name=_('Флаг'),
                                          help_text=_("Флаг..")) # User Library
    data1           = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные1'),
                                       help_text=_("Введите дополнительные данные 1"))
    data2           = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные2'),
                                       help_text=_("Введите дополнительные данные 2"))
    data3           = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные3'),
                                       help_text=_("Введите дополнительные данные 3"))
    data4           = models.CharField(max_length=50, blank=True, verbose_name=_('Доп.данные4'),
                                       help_text=_("Введите дополнительные данные 4"))
    

    #objects = BaseManager()
    #objects = ProductQuerySet.as_manager()

    class Meta:
        ordering = ['id']
        verbose_name = _('Содержание страницы')
        verbose_name_plural = _('Содержание страницы')

    def save(self):
        self.desc_html = markdown(self.description)
        super(Base, self).save()


    #def get_absolute_url(self):
        #qs = Product.objects.cat_objects(self.category)
        #return "/products/{slug}/".format(slug=self.slug)
        #return reverse("products:detail", kwargs={"category": qs[0].category.slug, "slug": self.slug})
    
    def get_absolute_url_cat(self):
        #qs = Product.objects.cat_objects(self.category)
        #qss = Category.objects.filter(title=qs.category)
        return 'home/'
        #return reverse("products:category", kwargs={"category": qs[0].category.slug})

    def __str__(self):
        return self.title

    #def __unicode__(self):
        #return self.title

    #def cat_slug(self):
        #return Category.objects.filter(slug=self.category_id)


class Contact(models.Model):
    fullname         = models.CharField(max_length=120, verbose_name=_('Полное имя'))
    email            = models.EmailField(max_length=120, verbose_name=_('Эл.почта'))
    phone            = models.CharField(max_length=120, blank=True, verbose_name=_('Телефон'))
    content          = models.CharField(max_length=500, blank=True, verbose_name=_('Содержание'))
    ipaddr           = models.CharField(max_length=120, blank=True, verbose_name=_('IP адрес'))
    timestamp        = models.DateTimeField(auto_now_add=True, verbose_name=_('Дата'))
    flag             = models.BooleanField(default=False, verbose_name=_('Флаг'))


    class Meta:
        ordering = ['id']
        verbose_name = _('Сообщения')
        verbose_name_plural = _('Сообщения')

    

