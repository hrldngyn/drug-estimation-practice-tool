# Generated by Django 4.0.2 on 2022-08-15 18:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pharmaceutics', '0005_molecule_reference'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='molecule',
            name='FunctionalGroups',
        ),
        migrations.RemoveField(
            model_name='molecule',
            name='LogP',
        ),
    ]