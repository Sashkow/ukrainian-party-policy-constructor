# Generated by Django 2.0.9 on 2018-12-28 10:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Policy',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('policy', models.TextField()),
                ('party', models.CharField(blank=True, max_length=200, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='QuestionAnswer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category', models.CharField(blank=True, max_length=200, null=True)),
                ('subcategory', models.CharField(blank=True, max_length=200, null=True)),
                ('question', models.CharField(max_length=1000)),
                ('answer', models.CharField(max_length=1000)),
                ('answer_type', models.CharField(blank=True, max_length=200, null=True)),
                ('policies', models.TextField(blank=True, null=True)),
            ],
        ),
        migrations.AddField(
            model_name='policy',
            name='qa',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='questionnaire.QuestionAnswer'),
        ),
    ]
