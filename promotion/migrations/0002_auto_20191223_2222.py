# Generated by Django 2.0.13 on 2019-12-23 19:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('promotion', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='data1',
            field=models.CharField(blank=True, help_text='Enter additional data 1', max_length=50, verbose_name='Add.data1'),
        ),
        migrations.AddField(
            model_name='image',
            name='data2',
            field=models.CharField(blank=True, help_text='Enter additional data 2', max_length=50, verbose_name='Add.data2'),
        ),
    ]
