# Generated by Django 2.0.13 on 2019-08-28 19:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0009_auto_20190828_1922'),
    ]

    operations = [
        migrations.AlterField(
            model_name='base',
            name='data1',
            field=models.CharField(blank=True, help_text='Введите дополнительные данные 1', max_length=50, verbose_name='Доп.данные1'),
        ),
        migrations.AlterField(
            model_name='base',
            name='data2',
            field=models.CharField(blank=True, help_text='Введите дополнительные данные 2', max_length=50, verbose_name='Доп.данные2'),
        ),
        migrations.AlterField(
            model_name='base',
            name='data3',
            field=models.CharField(blank=True, help_text='Введите дополнительные данные 3', max_length=50, verbose_name='Доп.данные3'),
        ),
        migrations.AlterField(
            model_name='base',
            name='data4',
            field=models.CharField(blank=True, help_text='Введите дополнительные данные 4', max_length=50, verbose_name='Доп.данные4'),
        ),
    ]
