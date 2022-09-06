# Generated by Django 3.2 on 2021-09-02 08:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('first', '0004_attendance'),
    ]

    operations = [
        migrations.CreateModel(
            name='Alert',
            fields=[
                ('Serialno', models.AutoField(primary_key=True, serialize=False)),
                ('classname_a', models.CharField(max_length=50)),
                ('Student_a', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='first.userdata')),
            ],
        ),
    ]