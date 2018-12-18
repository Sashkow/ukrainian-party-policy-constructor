from django.shortcuts import render

from django.dispatch import receiver
from forms_builder.forms.signals import form_valid
from forms_builder.forms.models import Form, Field, FormEntry, FieldEntry

from django.contrib.messages import get_messages
# Form.objects.get(slug='golosuvalka')

def field_slug_to_label(slug):
    field = Field.objects.filter(form__slug='golosuvalka', slug=slug)
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
        answers = []
        for item in request.POST:
            if item!='csrfmiddlewaretoken':
                question = field_slug_to_label(item)
                answer = request.POST.getlist(item)
                answer = ', '.join(answer)
                answers.append(question + ' ' + answer)
        answers = '\n'.join(answers)
        return render(request, 'to_policies.html', {'answers': answers})

    return render(request, 'questionnaire.html')



@receiver(form_valid)
def set_username(sender=None, form=None, entry=None, **kwargs):
    request = sender





# Create your views here.
