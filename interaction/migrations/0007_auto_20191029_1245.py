# Generated by Django 2.0.13 on 2019-10-29 12:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('interaction', '0006_correspondence_action'),
    ]

    operations = [
        migrations.AddField(
            model_name='correspondence',
            name='content_html',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='correspondence',
            name='feedback',
            field=models.CharField(blank=True, max_length=120, verbose_name='обратная связь'),
        ),
        migrations.AddField(
            model_name='correspondence',
            name='subject',
            field=models.CharField(blank=True, max_length=120, verbose_name='Предмет письма'),
        ),
        migrations.AddField(
            model_name='correspondence',
            name='theme',
            field=models.CharField(blank=True, max_length=120, verbose_name='Тема письма'),
        ),
        migrations.AlterField(
            model_name='correspondence',
            name='content',
            field=models.TextField(blank=True, max_length=1000, verbose_name='Содержание письма'),
        ),
    ]