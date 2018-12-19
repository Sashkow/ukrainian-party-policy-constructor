from django.shortcuts import render

# Create your views here.

def demo_form(request):
    return render(request, 'demo_pub/demo_form.html', {})