# Generated by Django 2.0.13 on 2019-11-01 09:36

from django.db import migrations, models
import django.db.models.deletion
import promotion.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, help_text='Выберете изображение', null=True, upload_to=promotion.models.upload_image_path, verbose_name='Изображение')),
                ('slug', models.SlugField(default='imageslug', help_text='Слаг..', verbose_name='Слаг')),
                ('title', models.CharField(blank=True, help_text='Введите заголовок', max_length=120, verbose_name='Заголовок')),
                ('sentence', models.CharField(blank=True, help_text='Введите предложение', max_length=120, verbose_name='Предложение')),
                ('description', models.TextField(help_text='Введите текст', verbose_name='Текст')),
                ('desc_html', models.TextField(blank=True)),
            ],
            options={
                'verbose_name': 'Изображения дополнительно',
                'verbose_name_plural': 'Изображения дополнительно',
            },
        ),
        migrations.CreateModel(
            name='Promotion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category', models.CharField(help_text='Введите название категории', max_length=120, verbose_name='Категория рекламы')),
                ('title', models.CharField(help_text='Введите заголовок контекста', max_length=120, verbose_name='Заголовок')),
                ('slug', models.SlugField(help_text='Слаг..', verbose_name='Слаг')),
                ('subtitle', models.CharField(blank=True, help_text='Введите подзаголовок контекста', max_length=120, verbose_name='Подзаголовок')),
                ('sentence', models.CharField(blank=True, help_text='Введите предложение', max_length=120, verbose_name='Предложение')),
                ('description', models.TextField(help_text='Введите текст', verbose_name='Текст')),
                ('desc_html', models.TextField(blank=True)),
                ('image', models.ImageField(blank=True, help_text='Выберете изображение', null=True, upload_to=promotion.models.upload_image_path, verbose_name='Изображение')),
                ('filenum', models.PositiveSmallIntegerField(default=0, help_text='Номер файла', verbose_name='Файл')),
                ('urllink', models.URLField(blank=True, help_text='Введите ссылку на ресурс', verbose_name='Ссылка')),
                ('timestamp', models.DateTimeField(auto_now_add=True, help_text='Дата/время создания контекста', verbose_name='Дата')),
                ('flag', models.BooleanField(default=False, help_text='Флаг..', verbose_name='Флаг')),
                ('data1', models.CharField(blank=True, help_text='Введите дополнительные данные 1', max_length=50, verbose_name='Доп.данные1')),
                ('data2', models.CharField(blank=True, help_text='Введите дополнительные данные 2', max_length=50, verbose_name='Доп.данные2')),
                ('data3', models.CharField(blank=True, help_text='Введите дополнительные данные 3', max_length=50, verbose_name='Доп.данные3')),
                ('data4', models.CharField(blank=True, help_text='Введите дополнительные данные 4', max_length=50, verbose_name='Доп.данные4')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Продвижение',
                'verbose_name_plural': 'Продвижение',
            },
        ),
        migrations.AddField(
            model_name='image',
            name='name',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='images', to='promotion.Promotion'),
        ),
    ]
