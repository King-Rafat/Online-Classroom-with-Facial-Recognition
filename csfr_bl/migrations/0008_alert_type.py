# Generated by Django 3.2 on 2021-09-02 23:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('first', '0007_check_checkopen'),
    ]

    operations = [
        migrations.AddField(
            model_name='alert',
            name='type',
            field=models.CharField(default=1, max_length=50),
            preserve_default=False,
        ),
    ]