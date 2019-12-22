# Generated by Django 2.0.13 on 2019-12-21 10:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0025_auto_20191218_2253'),
    ]

    operations = [
        migrations.AddField(
            model_name='clients',
            name='count',
            field=models.PositiveSmallIntegerField(default=0, help_text='Number of email sent', verbose_name='Email counter'),
        ),
        migrations.AlterField(
            model_name='clients',
            name='counter',
            field=models.PositiveSmallIntegerField(default=0, help_text='Number of tick made', verbose_name='Tick counter'),
        ),
    ]
