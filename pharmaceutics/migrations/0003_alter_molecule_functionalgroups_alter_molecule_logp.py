# Generated by Django 4.0.2 on 2022-08-14 20:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pharmaceutics', '0002_molecule_litpka'),
    ]

    operations = [
        migrations.AlterField(
            model_name='molecule',
            name='FunctionalGroups',
            field=models.ManyToManyField(blank=True, to='pharmaceutics.FunctionalGroup'),
        ),
        migrations.AlterField(
            model_name='molecule',
            name='LogP',
            field=models.FloatField(blank=True, max_length=4, null=True),
        ),
    ]
