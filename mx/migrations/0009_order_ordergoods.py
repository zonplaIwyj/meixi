# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-18 11:34
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mx', '0008_auto_20190117_0139'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField(default=0)),
                ('createtime', models.DateTimeField(auto_now_add=True)),
                ('identifier', models.CharField(max_length=256)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mx.User')),
            ],
        ),
        migrations.CreateModel(
            name='Ordergoods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('num', models.IntegerField()),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mx.Good')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mx.Order')),
            ],
        ),
    ]
