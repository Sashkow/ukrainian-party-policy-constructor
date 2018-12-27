from django.contrib import admin
from .models import Policy, QuestionAnswer

from import_export.admin import ImportExportMixin, ImportMixin, ExportActionModelAdmin
from import_export.resources import ModelResource


class PolicyAdmin(ImportExportMixin, admin.ModelAdmin):
    list_display = [field.name for field in Policy._meta.fields]
    exclude = ['ID']


class QuestionAnswerResource(ModelResource):
    class Meta:
        model = QuestionAnswer

        # fields = ['name', 'author', ]


class QuestionAnswerAdmin(ImportExportMixin, admin.ModelAdmin):
    list_display = [field.name for field in QuestionAnswer._meta.fields]
    exclude = ['ID']
    resource_class = QuestionAnswerResource
    list_per_page = 20


admin.site.register(Policy, PolicyAdmin)
admin.site.register(QuestionAnswer, QuestionAnswerAdmin)
