# Generated by Django 2.0.13 on 2019-11-01 12:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scheduler', '0003_auto_20191101_1252'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scheduler',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]
