# Generated by Django 2.0.13 on 2019-10-28 19:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('interaction', '0003_auto_20191028_1952'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contact',
            name='id',
            field=models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]