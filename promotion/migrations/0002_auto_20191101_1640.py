# Generated by Django 2.0.13 on 2019-11-01 16:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('promotion', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='promotion',
            name='category',
            field=models.CharField(choices=[('HVAC', 'HVAC'), ('Smart Home', 'Smart Home'), ('IoT', 'IoT'), ('Facebook', 'Facebook'), ('Mathematics', 'Mathematics')], default='HVAC', help_text='Выберете категорию деятельности', max_length=30, verbose_name='Категория'),
        ),
    ]