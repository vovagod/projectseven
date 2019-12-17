# Generated by Django 2.0.13 on 2019-11-14 19:19

import clients.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0013_auto_20191114_1837'),
    ]

    operations = [
        migrations.AlterField(
            model_name='clients',
            name='file',
            field=models.FileField(blank=True, help_text='Файл данных от клиента', null=True, upload_to=clients.models.upload_image_path, verbose_name='Файл'),
        ),
    ]
