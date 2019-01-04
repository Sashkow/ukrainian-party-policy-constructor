from django.core.management.base import BaseCommand, CommandError
from questionnaire.models import QuestionAnswer
from slugify import slugify


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    # def add_arguments(self, parser):
    #     parser.add_argument('poll_id', nargs='+', type=int)

    def handle(self, *args, **options):
        qua = QuestionAnswer.objects.all()
        for item in qua:
            item.slug = slugify(item.question).replace('-', '_')
            item.save()

