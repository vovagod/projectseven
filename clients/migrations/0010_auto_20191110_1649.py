# Generated by Django 2.0.13 on 2019-11-10 16:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0009_clients_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='clients',
            name='slug',
            field=models.SlugField(help_text='Слаг..', verbose_name='Слаг'),
        ),
    ]
