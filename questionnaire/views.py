from django.shortcuts import render

from django.dispatch import receiver
from forms_builder.forms.signals import form_valid
from forms_builder.forms.models import Form, Field, FormEntry, FieldEntry
from questionnaire.utils import parse_policies, select_random
from questionnaire.models import QuestionAnswer
from django.core.mail import send_mail
import html2text

import mock
from slugify import slugify

from django.db.models import Q

from collections import OrderedDict


from django.contrib.messages import get_messages
# Form.objects.get(slug='golosuvalka')

def field_slug_to_label(slug):
    field = Field.objects.filter(form__slug='questions', slug=slug)
    if len(field)==1:
        label = field[0].label
    else:
        return None

def to_policies(request):
    print(request)
    return render(request, 'to_policies.html')

def questionnaire(request):
    if request.method == "POST":
        party_name = "Партія"
        political_platform = []

        preambles = QuestionAnswer.objects.filter(question="Преамбули")
        if preambles.exists():
            preambles = preambles[0].policies
            preambles = parse_policies(preambles)
            preamble, party = select_random(preambles)
            preamble = '<p class="preamble">' + preamble + '</p>'
        else:
            preamble = '<p class="preamble">' + "Українці," + '</p>'



        answers = []
        for item in request.POST:
            current_answers = request.POST.getlist(item)
            answers = answers + current_answers

        # question_answers = {field_slug_to_label(item):request.POST.getlist(item) for item in request if item}


        for item in request.POST:
            if item == 'party_name':
                party_name = request.POST[item]
            elif item == 'user_email':
                user_email = request.POST[item]



        question_answers = QuestionAnswer.objects.filter(answer__in=answers).order_by('id')
        political_platform = []
        for question_answer in question_answers:
            question = question_answer.question
            answer = question_answer.answer
            policies = question_answer.policies
            parsed = parse_policies(policies)
            policy, party = select_random(parsed)
            political_platform.append('<p class="fragment">' + policy + '</p>')
        political_platform = '\n'.join(political_platform)

        if user_email:
            send_mail(
                'Політична програма партії "'+ party_name + '"',
            '\n'.join([html2text.html2text(political_platform), html2text.html2text(preamble)]),
                'chasnyk@populi.chesno.org',
                [user_email,],
                fail_silently=False,
            )

        return render(request, 'to_policies.html',
                      {'answers': political_platform,
                       "party_name":party_name,
                       "preamble":preamble}
        )
    else:
        # if method GET
        question_answers = QuestionAnswer.objects.filter(~Q(question="Преамбули")).order_by('id')
        quas = OrderedDict()

        for question_answer in question_answers:
            qa_obj = mock.Mock()
            qa_obj.question = question_answer.question
            qa_obj.underscore_slug = question_answer.slug  #slugify(qa_obj.question).replace('-','_')

            answer_obj = mock.Mock()
            answer_obj.value = question_answer.answer
            answer_obj.slug = slugify(answer_obj.value)
            answer_obj.underscore_slug = answer_obj.slug.replace('-', '_') + '_' + str(question_answer.id)

            qa_obj.answers = [answer_obj,]
            qa_obj.category = question_answer.category
            qa_obj.subcategory = question_answer.subcategory
            qa_obj.answer_type = question_answer.answer_type

            if question_answer.question in quas:
                quas[question_answer.question].answers.append(answer_obj)
            else:
                quas[question_answer.question] = qa_obj


        return render(request, 'questionnaire.html', {"question_answers":quas,})



@receiver(form_valid)
def set_username(sender=None, form=None, entry=None, **kwargs):
    request = sender





# Create your views here.
