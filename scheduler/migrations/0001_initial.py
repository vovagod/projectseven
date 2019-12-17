# Generated by Django 2.0.13 on 2019-11-01 12:36

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Scheduler',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('category', models.CharField(choices=[('server', 'Server'), ('facebook', 'Facebook'), ('mathematics', 'Mathematics')], help_text='Выберете название категории', max_length=30, verbose_name='Категория рассылки')),
                ('tick', models.PositiveSmallIntegerField(blank=True, default=0, help_text='Введите количесво тиков, 1 тик равен 1 часу', null=True, verbose_name='Количество тиков')),
                ('counter', models.PositiveSmallIntegerField(blank=True, default=0, editable=False, help_text='Подсчет тиков', null=True, verbose_name='Счетчик тиков')),
            ],
            options={
                'verbose_name': 'Планировщик',
                'verbose_name_plural': 'Планировщик',
                'ordering': ['id'],
            },
        ),
    ]
