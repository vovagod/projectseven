# Generated by Django 2.0.13 on 2019-11-06 17:31

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0004_auto_20191101_1640'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='clients',
            options={'verbose_name': 'Клиенты', 'verbose_name_plural': 'Клиенты'},
        ),
        migrations.RemoveField(
            model_name='clients',
            name='id',
        ),
        migrations.AddField(
            model_name='clients',
            name='counter',
            field=models.PositiveSmallIntegerField(blank=True, default=0, help_text='Количество оправленных писем', null=True, verbose_name='Счетчик  отправок'),
        ),
        migrations.AddField(
            model_name='clients',
            name='uuid',
            field=models.UUIDField(default=uuid.uuid4, editable=False, help_text='Номер UUID', primary_key=True, serialize=False),
        ),
    ]