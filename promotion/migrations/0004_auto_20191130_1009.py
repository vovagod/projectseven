# Generated by Django 2.0.13 on 2019-11-30 10:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('promotion', '0003_auto_20191106_1731'),
    ]

    operations = [
        migrations.AlterField(
            model_name='promotion',
            name='category',
            field=models.CharField(choices=[('HVAC', 'HVAC'), ('Smart Home', 'Smart Home'), ('IoT', 'IoT'), ('Facebook', 'Facebook'), ('Mathematics', 'Mathematics'), ('SFUGD', 'SFUGD')], default='HVAC', help_text='Выберете категорию деятельности', max_length=30, unique=True, verbose_name='Категория'),
        ),
    ]
