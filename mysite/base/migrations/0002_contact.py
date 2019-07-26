# Generated by Django 2.0.13 on 2019-07-24 20:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fullname', models.CharField(max_length=120, unique=True, verbose_name='Полное имя')),
                ('email', models.EmailField(max_length=120, unique=True, verbose_name='Эл.почта')),
                ('phone', models.CharField(max_length=120, unique=True, verbose_name='Телефон')),
                ('content', models.CharField(blank=True, max_length=500, verbose_name='Содержание')),
                ('ipaddr', models.CharField(blank=True, max_length=120, verbose_name='IP адрес')),
                ('timestamp', models.DateTimeField(auto_now_add=True, verbose_name='Дата')),
                ('flag', models.BooleanField(default=False, verbose_name='Флаг')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Контакты',
                'verbose_name_plural': 'Контакты',
            },
        ),
    ]
