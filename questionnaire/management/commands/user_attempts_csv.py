from django.core.management.base import BaseCommand, CommandError
from questionnaire.models import QuestionAnswer, UserAttemptQuestionAnswer, UserAttempt
from slugify import slugify


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    # def add_arguments(self, parser):
    #     parser.add_argument('poll_id', nargs='+', type=int)
    def handle(self, *args, **options):
        for user_attempt in UserAttempt.objects.all():
            print(user_attempt.id, user_attempt.party_name)
            question_answers = UserAttemptQuestionAnswer.objects.filter(user_attempt=user_attempt)
            for question_answer in question_answers:
                print("\t", question_answer.question_answer)


