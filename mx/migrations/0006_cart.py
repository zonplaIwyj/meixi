# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-15 12:30
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mx', '0005_good_gray'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('num', models.IntegerField(default=1)),
                ('is_selected', models.BooleanField(default=True)),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mx.Good')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mx.User')),
            ],
        ),
    ]
