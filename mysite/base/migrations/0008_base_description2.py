# Generated by Django 2.0.13 on 2019-08-28 18:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0007_base_desc_html'),
    ]

    operations = [
        migrations.AddField(
            model_name='base',
            name='description2',
            field=models.TextField(blank=True, help_text='Введите текст2', verbose_name='Текст2'),
        ),
    ]
