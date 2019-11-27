# Generated by Django 2.0.13 on 2019-10-14 20:30

from django.db import migrations, models
import mysite.base.models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0007_auto_20191006_1927'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='desc_html',
            field=models.TextField(blank=True),
        ),
        migrations.AlterField(
            model_name='base',
            name='image',
            field=models.ImageField(blank=True, help_text='Выберете изображение', null=True, upload_to=mysite.base.models.upload_image_path, verbose_name='Изображение'),
        ),
        migrations.AlterField(
            model_name='image',
            name='title',
            field=models.CharField(blank=True, help_text='Введите заголовок', max_length=120, verbose_name='Заголовок'),
        ),
    ]
