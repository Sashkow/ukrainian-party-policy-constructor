from django.db import models
from forms_builder.forms.models import Form, FormEntry


# form entry to policies
#


class QuestionAnswer(models.Model):
    category = models.CharField(max_length=200, null=True, blank=True)
    subcategory = models.CharField(max_length=200, null=True, blank=True)
    question = models.CharField(max_length=1000)
    slug = models.CharField(max_length=1000, null=True, blank=True)
    answer = models.CharField(max_length=1000)
    answer_type = models.CharField(max_length=200, null=True, blank=True)
    policies = models.TextField(null=True, blank=True)

    def __str__(self):
        return ' | '.join([self.question, self.answer])

class UserAttempt(models.Model):
    policical_platform_html = models.TextField(null=True, blank=True)
    preamble_html = models.TextField(null=True, blank=True)
    party_name = models.CharField(max_length=1000, null=True, blank=True)


class UserAttemptQuestionAnswer(models.Model):
    user_attempt = models.ForeignKey('UserAttempt', on_delete=models.CASCADE)
    qestion_answer = models.ForeignKey('QuestionAnswer', on_delete=models.CASCADE)



class Policy(models.Model):
    qa = models.ForeignKey(QuestionAnswer, on_delete=models.PROTECT, null=True, blank=True)
    policy = models.TextField()
    party = models.CharField(max_length=200, null=True, blank=True)
    def __str__(self):
        return ' | '.join([self.policy[:20], self.party])

    # todo
    # track mutually exclusive paragraphs

