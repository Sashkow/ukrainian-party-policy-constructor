from django.db import models


# form entry to policies
#

class Policy(models.Model):
    form_slug = models.SlugField(default="golosuvalka")
    category = models.CharField(max_length=200, null=True, blank=True)
    subcategory = models.CharField(max_length=200, null=True, blank=True)
    question = models.CharField(max_length=1000)
    answer = models.CharField(max_length=1000)
    policy = models.TextField()
    party = models.CharField(max_length=200, null=True, blank=True)



    # form slug
    # question
    # answer
    # policy
# Create your models here.


