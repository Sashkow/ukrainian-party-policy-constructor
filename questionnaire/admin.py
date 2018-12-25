from django.contrib import admin
from .models import Policy

class PolicyAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Policy._meta.fields]
    exclude = ['ID']
admin.site.register(Policy, PolicyAdmin)


from .models import demo_model
admin.site.register(demo_model)



# from .models import CustomW

# admin.site.register(CustomW)

# Register your models here.
