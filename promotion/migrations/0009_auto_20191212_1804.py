# Generated by Django 2.0.13 on 2019-12-12 18:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('promotion', '0008_auto_20191207_1105'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='image',
            options={'ordering': ['id'], 'verbose_name': 'Дополнительное изображение', 'verbose_name_plural': 'Дополнительные изображения'},
        ),
        migrations.AlterModelOptions(
            name='promotion',
            options={'ordering': ['category', 'language'], 'verbose_name': 'Промоция', 'verbose_name_plural': 'Промоция'},
        ),
        migrations.AlterField(
            model_name='image',
            name='description',
            field=models.TextField(help_text='Enter a text', verbose_name='Текст'),
        ),
        migrations.AlterField(
            model_name='image',
            name='slug',
            field=models.SlugField(default='imageslug', help_text='Слаг', verbose_name='Слаг'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='category',
            field=models.CharField(choices=[('HVAC', 'HVAC'), ('Smart Home', 'Smart Home'), ('IoT', 'IoT'), ('Facebook', 'Facebook'), ('Mathematics', 'Mathematics'), ('SFUGD', 'SFUGD')], default='HVAC', help_text='Выберете категорию', max_length=30, verbose_name='Категория'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='data1',
            field=models.CharField(blank=True, help_text='Введите доп.данные1', max_length=50, verbose_name='Доп.данные1'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='data2',
            field=models.CharField(blank=True, help_text='Введите доп.данные2', max_length=50, verbose_name='Доп.данные2'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='data3',
            field=models.CharField(blank=True, help_text='Введите доп.данные3', max_length=50, verbose_name='Доп.данные3'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='data4',
            field=models.CharField(blank=True, help_text='Введите доп.данные4', max_length=50, verbose_name='Доп.данные4'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='description',
            field=models.TextField(help_text='Enter a text', verbose_name='Текст'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='flag',
            field=models.BooleanField(default=False, help_text='Флаг', verbose_name='Флаг'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='slug',
            field=models.SlugField(help_text='Слаг', verbose_name='Слаг'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='subtitle',
            field=models.CharField(blank=True, help_text='Введите подзаголовок', max_length=120, verbose_name='Подменю'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='timestamp',
            field=models.DateTimeField(auto_now_add=True, help_text='Дата/время создания', verbose_name='Дата'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='title',
            field=models.CharField(help_text='Введите заголовок', max_length=120, verbose_name='Заголовок'),
        ),
        migrations.AlterField(
            model_name='promotion',
            name='urllink',
            field=models.URLField(blank=True, help_text='Введите URL ссылку', verbose_name='URL ссылка'),
        ),
    ]