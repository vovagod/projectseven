# Generated by Django 2.0.13 on 2019-12-15 08:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('promotion', '0009_auto_20191212_1804'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='language',
            field=models.CharField(default='en', max_length=100),
        ),
    ]
