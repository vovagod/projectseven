# Generated by Django 2.0.13 on 2019-11-10 11:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0008_auto_20191109_2050'),
    ]

    operations = [
        migrations.AddField(
            model_name='clients',
            name='slug',
            field=models.SlugField(default='noname-company', help_text='Слаг..', verbose_name='Слаг'),
        ),
    ]
