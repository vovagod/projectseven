# Generated by Django 2.0.13 on 2019-12-29 18:21

from django.db import migrations, models
import django.db.models.deletion
import mysite.common.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, help_text='Select an image', null=True, upload_to=mysite.common.models.upload_image_path, verbose_name='Image')),
                ('slug', models.SlugField(default='imageslug', help_text='Slug', verbose_name='Slug')),
                ('title', models.CharField(blank=True, help_text='Enter a title', max_length=120, verbose_name='Title')),
                ('sentence', models.CharField(blank=True, help_text='Enter a sentence', max_length=120, verbose_name='Sentence')),
                ('urllink', models.URLField(blank=True, help_text='Enter URL link', verbose_name='URL link')),
                ('description', models.TextField(help_text='Enter a text', verbose_name='Text')),
                ('desc_html', models.TextField(blank=True)),
                ('data1', models.CharField(blank=True, help_text='Enter additional data 1', max_length=50, verbose_name='Add.data1')),
                ('data2', models.CharField(blank=True, help_text='Enter additional data 2', max_length=50, verbose_name='Add.data2')),
            ],
            options={
                'verbose_name_plural': 'Additional images',
                'ordering': ['id'],
                'verbose_name': 'Additional image',
            },
        ),
        migrations.CreateModel(
            name='Promotion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(help_text='Enter title', max_length=120, verbose_name='Title')),
                ('slug', models.SlugField(help_text='Slug', verbose_name='Slug')),
                ('subtitle', models.CharField(blank=True, help_text='Enter subtitle', max_length=120, verbose_name='Subtitle')),
                ('sentence', models.CharField(blank=True, help_text='Enter sentence', max_length=120, verbose_name='Sentence')),
                ('description', models.TextField(help_text='Enter text', verbose_name='Text')),
                ('desc_html', models.TextField(blank=True)),
                ('image', models.ImageField(blank=True, help_text='Select image', null=True, upload_to=mysite.common.models.upload_image_path, verbose_name='Image')),
                ('filenum', models.PositiveSmallIntegerField(default=0, help_text='File number', verbose_name='File')),
                ('urllink', models.URLField(blank=True, help_text='Enter URL link', verbose_name='URL link')),
                ('timestamp', models.DateTimeField(auto_now_add=True, help_text='Date/time of cretion', verbose_name='Date')),
                ('flag', models.BooleanField(default=False, help_text='Flag', verbose_name='Flag')),
                ('data1', models.CharField(blank=True, help_text='Enter additional data 1', max_length=50, verbose_name='Add.data1')),
                ('data2', models.CharField(blank=True, help_text='Enter additional data 2', max_length=50, verbose_name='Add.data2')),
                ('data3', models.CharField(blank=True, help_text='Enter additional data 3', max_length=50, verbose_name='Add.data3')),
                ('data4', models.CharField(blank=True, help_text='Enter additional data 4', max_length=50, verbose_name='Add.data4')),
                ('category', models.CharField(choices=[('HVAC', 'HVAC'), ('Smart Home', 'Smart Home'), ('IoT', 'IoT'), ('Facebook', 'Facebook'), ('Mathematics', 'Mathematics'), ('SFUGD', 'SFUGD')], default='HVAC', help_text='Select category', max_length=30, verbose_name='Category')),
                ('language', models.CharField(choices=[('RU', 'RU'), ('EN', 'EN')], default='RU', help_text='Select language', max_length=30, verbose_name='Language')),
            ],
            options={
                'verbose_name_plural': 'Promotion',
                'ordering': ['category', 'language'],
                'verbose_name': 'Promotion',
            },
        ),
        migrations.AlterUniqueTogether(
            name='promotion',
            unique_together={('category', 'language')},
        ),
        migrations.AddField(
            model_name='image',
            name='name',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='images', to='promotion.Promotion'),
        ),
    ]
