"""policy_constructor URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from    django.urls import path

from django.conf.urls import include
from questionnaire.views import to_policies, questionnaire

import forms_builder.forms.urls # add this import

urlpatterns = [
    path('admin/', admin.site.urls),
    path(r'forms/', include(forms_builder.forms.urls)),
    path(r'to_policies/', to_policies, name='to_policies'),
    path(r'questionnaire/', questionnaire, name='questionnaire'),
    #  path(r'demo/', demo_pub, name='demo'),

]


# http://127.0.0.1:8000/admin/