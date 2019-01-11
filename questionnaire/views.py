from argparse import _AppendAction

from django.shortcuts import render, reverse

from django.http import HttpResponse, HttpResponseRedirect

from django.dispatch import receiver
from forms_builder.forms.signals import form_valid
from forms_builder.forms.models import Form, Field, FormEntry, FieldEntry
from questionnaire.utils import parse_policies, select_random
from questionnaire.models import QuestionAnswer, UserAttemptQuestionAnswer, UserAttempt
from django.core.mail import send_mail
import html2text

import mock
from slugify import slugify

from django.db.models import Q

from collections import OrderedDict
import io


# import io.StringIO as StringIO
from xhtml2pdf import pisa
from django.template.loader import get_template
from django.template import Context
from django.http import HttpResponse
from html import escape


from django.contrib import messages




def render_to_pdf(template_src, context_dict):
    template = get_template(template_src)
    context = context_dict
    html  = template.render(context)
    result = ""

    pdf = pisa.pisaDocument(html, result)
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return HttpResponse('We had some errors<pre>%s</pre>' % escape(html))



from django.contrib.messages import get_messages
# Form.objects.get(slug='golosuvalka')


def field_slug_to_label(slug):
    field = Field.objects.filter(form__slug='questions', slug=slug)
    if len(field)==1:
        label = field[0].label
    else:
        return None


def to_policies(request, attempt_id):
    """

    :param request: http request
    :param attempt_id: id for user attempt to generate political platform; id of UserAttempt model
    :return: http response with political platfom text and unique url
    """
    not_found = 'Не знайдено'
    political_platform = not_found
    preamble = not_found
    party_name = not_found

    try:
        user_attempt = UserAttempt.objects.get(id=attempt_id)
        political_platform = user_attempt.policical_platform_html
        preamble = user_attempt.preamble_html
        party_name = user_attempt.party_name
    except UserAttempt.DoesNotExist:
        user_attempt = None

    return render(request, 'to_policies.html',
                  {'answers': political_platform,
                   "party_name": party_name,
                   "preamble": preamble,
                   "full_url": request.build_absolute_uri(),}
                  )
    # return render(request, 'to_policies.html')


def questionnaire(request):
    if request.method == "POST":
        party_name = "Партія"
        political_platform = []

        preambles = QuestionAnswer.objects.filter(question="Преамбули")
        if preambles.exists():
            preambles = preambles[0].policies
            preambles = parse_policies(preambles)
            preamble, party = select_random(preambles)
            preamble_abstracts = ['<p class="preamble">' + abstract + '</p>' for abstract in preamble.split('\n') ]
            preamble = '\n'.join(preamble_abstracts)
        else:
            preamble = '<p class="preamble">' + "Українці," + '</p>'


        answers = []
        for item in request.POST:
            current_answers = request.POST.getlist(item)
            answers = answers + current_answers

        # question_answers = {field_slug_to_label(item):request.POST.getlist(item) for item in request if item}

        permission = False
        for item in request.POST:
            if item == 'party_name':
                party_name = request.POST[item]
                party_name = party_name.strip()
            elif item == 'user_email':
                user_email = request.POST[item]
            elif item == 'permission':
                permission = True




        question_answers = QuestionAnswer.objects.filter(answer__in=answers).order_by('id')
        political_platform = []
        current_category = ""
        current_subcategory = ""
        for question_answer in question_answers:
            question = question_answer.question
            answer = question_answer.answer
            policies = question_answer.policies
            parsed = parse_policies(policies)
            policy, party = select_random(parsed)
            if question_answer.category != current_category:
                current_category = question_answer.category
                political_platform.append('<p class="category">' + current_category + '</p>')

            if question_answer.subcategory != current_subcategory:
                current_subcategory = question_answer.subcategory
                political_platform.append('<p class="subcategory">' + current_subcategory + '</p>')

            political_platform.append('<p class="fragment">' + policy + '</p>')

        political_platform = '\n'.join(political_platform)

        if user_email:
            if party_name:
                subject = 'Політична програма партії "'+ party_name + '"'
            else:
                subject = 'Політична програма партії'
            send_mail(
                subject,
            '\n'.join([html2text.html2text(preamble), html2text.html2text(political_platform)]),
                'chasnyk@populi.chesno.org',
                [user_email,],
                fail_silently=False,
            )

        # messages.add_message(request, messages.INFO, political_platform, extra_tags = 'answers')
        # messages.add_message(request, messages.INFO, party_name, extra_tags='party_name')
        # messages.add_message(request, messages.INFO, preamble, extra_tags='preamble')
        if permission:

            user_attempt = UserAttempt.objects.create(
                policical_platform_html = political_platform,
                preamble_html = preamble,
                party_name = party_name,
            )

            user_attempt.save()

            for question_answer in question_answers:
                pair = UserAttemptQuestionAnswer(
                    question_answer = question_answer,
                    user_attempt = user_attempt,
                )
                pair.save()

            return HttpResponseRedirect(reverse('to_policies', args=(user_attempt.id,)))
        else:
            return render(request, 'to_policies.html',
                {'answers': political_platform,
                "party_name": party_name,
                "preamble": preamble,}
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


def to_pdf(request):
    results = {'html':"<h1>Hwllo</h1>", 'other':"other results"}
    #Retrieve data or whatever you need
    return render_to_pdf(
            'to_pdf.html',
            {
                'pagesize':'A4',
                'mylist': results,
            }
        )

#
# def other_view(request):
#     storage = get_messages(request)
#     name = None
#     for message in storage:
#         name = message
#         break
#     return render(request, 'general/other_view.html', {'name': name})
#
#
# # Create your views here.
