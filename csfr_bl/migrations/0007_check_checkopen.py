# Generated by Django 3.2 on 2021-09-02 23:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('first', '0006_check_grade'),
    ]

    operations = [
        migrations.AddField(
            model_name='check',
            name='checkopen',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]