# Generated by Django 2.0.13 on 2019-12-15 08:53

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('scheduler', '0010_scheduler_language'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='scheduler',
            name='language',
        ),
    ]