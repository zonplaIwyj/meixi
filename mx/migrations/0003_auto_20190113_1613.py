# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-13 16:13
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mx', '0002_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='password',
            field=models.CharField(max_length=2560),
        ),
    ]
