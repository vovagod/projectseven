# Generated by Django 2.0.13 on 2019-11-14 19:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0014_auto_20191114_1919'),
    ]

    operations = [
        migrations.AddField(
            model_name='clients',
            name='filepath',
            field=models.FilePathField(blank=True, null=True, path='/static/uploads/'),
        ),
    ]
