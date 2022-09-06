# Generated by Django 3.2 on 2021-08-17 08:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('first', '0002_alter_workerdoc_doc_path'),
    ]

    operations = [
        migrations.CreateModel(
            name='Stream',
            fields=[
                ('Streamno', models.AutoField(primary_key=True, serialize=False)),
                ('Content', models.TextField()),
                ('Classname', models.CharField(max_length=50)),
                ('posted', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='first.userdata')),
            ],
        ),
    ]
