# Generated by Django 2.0.13 on 2019-10-06 18:31

from django.db import migrations, models
import mysite.base.models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0004_auto_20191006_1800'),
    ]

    operations = [
        migrations.AlterField(
            model_name='base',
            name='image',
            field=models.ImageField(default='/home/vova/projectseven/static/media/no_image.jpg', help_text='Выберете изображение', upload_to=mysite.base.models.upload_image_path, verbose_name='Изображение'),
        ),
    ]