# Generated by Django 2.0.9 on 2019-01-11 13:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('questionnaire', '0002_questionanswer_slug'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserAttempt',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('policical_platform_html', models.TextField(blank=True, null=True)),
                ('preamble_html', models.TextField(blank=True, null=True)),
                ('party_name', models.CharField(blank=True, max_length=500, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='UserAttemptQuestionAnswer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qestion_answer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='questionnaire.QuestionAnswer')),
                ('user_attempt', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='questionnaire.UserAttempt')),
            ],
        ),
    ]
