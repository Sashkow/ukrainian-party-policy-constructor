from django.db import models
from django.utils import timezone


class HowAreYou(models.Model):
    Name = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    Title = models.CharField(max_length=200)
    Text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.Title
