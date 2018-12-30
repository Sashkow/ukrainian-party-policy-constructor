from django.shortcuts import render

from django.dispatch import receiver
from forms_builder.forms.signals import form_valid
from forms_builder.forms.models import Form, Field, FormEntry, FieldEntry
from questionnaire.utils import parse_policies, select_random
from questionnaire.models import QuestionAnswer
from django.core.mail import send_mail
import html2text

from django.contrib.messages import get_messages
# Form.objects.get(slug='golosuvalka')

def field_slug_to_label(slug):
    field = Field.objects.filter(form__slug='questions', slug=slug)
    if len(field)==1:
        label = field[0].label
    else:
        label = slug
    return label

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
            preamble = '<p>' + preamble  + '(' + party + ')' + '</p>'
        else:
            preamble = '<p>' + "Українці," + '</p>'



        for item in request.POST:
            if item == 'party_name':
                party_name = request.POST[item]
            elif item == 'user_email':
                user_email = request.POST[item]
            elif item!='csrfmiddlewaretoken':
                question = field_slug_to_label(item)
                answers = request.POST.getlist(item)
                for answer in answers:
                    policies = QuestionAnswer.objects.filter(
                        question=question,
                        answer=answer
                    )
                    if policies:
                        policies = policies[0].policies
                    else:
                        print("no policies for",question, answer)

                    parsed = parse_policies(policies)
                    policy, party = select_random(parsed)
                    political_platform.append('<p>' + policy + '(' + party + ')' + '</p>')

        political_platform = '\n'.join(political_platform)

        if user_email:
            send_mail(
                'Політична програма партії "'+party_name+'"',
            '\n'.join([html2text.html2text(political_platform), html2text.html2text(preamble)]),
                'polander@populi.chesno.org',
                [user_email,],
                fail_silently=False,
            )

        return render(request, 'to_policies.html', {'answers': political_platform, "party_name":party_name, "preamble":preamble})

    return render(request, 'questionnaire.html')



@receiver(form_valid)
def set_username(sender=None, form=None, entry=None, **kwargs):
    request = sender





# Create your views here.
