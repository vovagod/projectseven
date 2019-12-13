# Generated by Django 2.0.13 on 2019-12-12 18:04

import clients.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0021_auto_20191207_0828'),
    ]

    operations = [
        migrations.AddField(
            model_name='clients',
            name='last_post',
            field=models.DateTimeField(blank=True, null=True, verbose_name='Last post'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='category',
            field=models.CharField(choices=[('HVAC', 'HVAC'), ('Smart Home', 'Smart Home'), ('IoT', 'IoT'), ('Facebook', 'Facebook'), ('Mathematics', 'Mathematics'), ('SFUGD', 'SFUGD')], default='HVAC', help_text='Выберете категорию', max_length=30, verbose_name='Категория'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='counter',
            field=models.PositiveSmallIntegerField(default=0, help_text='Число отправленных сообщений', verbose_name='Счетчик рассылок'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='created',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Создан'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='email',
            field=models.EmailField(max_length=120, unique=True, verbose_name='Эл.почта компании'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='email2',
            field=models.EmailField(blank=True, max_length=120, null=True, verbose_name='Эл.почта персоны'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='error_mailing',
            field=models.CharField(blank=True, default='None', max_length=360, verbose_name='Отчет отправки'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='file',
            field=models.FileField(blank=True, help_text='Файл от клиента', null=True, upload_to=clients.models.upload_image_path, verbose_name='Файл'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='filepath',
            field=models.CharField(blank=True, max_length=120, verbose_name='Путь к загруженным файлам'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='slug',
            field=models.SlugField(help_text='Слаг', verbose_name='Слаг'),
        ),
    ]