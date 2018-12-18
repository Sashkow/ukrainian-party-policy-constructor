from django.contrib import admin
from .models import Policy

class PolicyAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Policy._meta.fields]
    exclude = ['ID']
admin.site.register(Policy, PolicyAdmin)


# Register your models here.
