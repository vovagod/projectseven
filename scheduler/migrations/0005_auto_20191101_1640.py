# Generated by Django 2.0.13 on 2019-11-01 16:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scheduler', '0004_auto_20191101_1255'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scheduler',
            name='category',
            field=models.CharField(choices=[('HVAC', 'HVAC'), ('Smart Home', 'Smart Home'), ('IoT', 'IoT'), ('Facebook', 'Facebook'), ('Mathematics', 'Mathematics')], help_text='Выберете название категории', max_length=30, verbose_name='Категория рассылки'),
        ),
    ]