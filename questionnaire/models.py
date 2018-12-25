from django.db import models
from django.utils import timezone
from djchoices import ChoiceItem, DjangoChoices

# form entry to policies
#

class Policy(models.Model):
    form_slug = models.SlugField(default="golosuvalka")
    category = models.CharField(max_length=200, null=True, blank=True)
    subcategory = models.CharField(max_length=200, null=True, blank=True)
    question = models.CharField(max_length=1000)
    answer = models.CharField(max_length=1000)
    policy = models.TextField()
    party = models.CharField(max_length=200, null=True, blank=True)



    # form slug
    # question
    # answer
    # policy
# Create your models here.

class ConditionVar(DjangoChoices):
    good = ChoiceItem('cond_one', "Good!")
    so_so = ChoiceItem('cond_two', "Not bad")
    bad = ChoiceItem('cond_three', "Very bad")


class WeaponVar(DjangoChoices):
    bomb = ChoiceItem('sec_one', "Bomb")
    rifle = ChoiceItem('sec_two', "Rifle")
    nothing = ChoiceItem('sec_three', "No one")


class demo_model(models.Model):
    Author = models.CharField(max_length=30, verbose_name='Author')
    Name = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    Title = models.CharField(max_length=200)
    Condition = models.CharField(max_length=20,
    	                         choices=ConditionVar.choices,
    	                         default=ConditionVar.good)

    Weapon = models.CharField(max_length=20,
    	                      choices=WeaponVar.choices,
    	                      default=WeaponVar.nothing)

    # Text = models.TextField()
    # created_date = models.DateTimeField(
    #         default=timezone.now)

    def publish(self):
        # self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.Title

	

# http://qaru.site/questions/7317522/get-data-from-postgresql-to-django-and-display-it-in-html
# import psycopg2
# import pprint

# def demo_out():
#     conn_string = "host='localhost' dbname='demo' user='postgres' password='demoPass'"

#     column_names = []
#     data_rows = []

#     with psycopg2.connect(conn_string) as connection:
#         with connection.cursor() as cursor:
#             cursor.execute("select id, name from music")
#             column_names = [desc[0] for desc in cursor.description]
#             for row in cursor:
#                 data_rows.append(row)
#                 records = cursor.fetchall()

#                 # print out the records using pretty print
#                 # note that the NAMES of the columns are not shown, instead just indexes.
#                 # for most people this isn't very useful so we'll show you how to return
#                 # columns as a dictionary (hash) in the next example.
#                 pprint.pprint(records)
#                 print (type(records))

#     print("Column names: {}\n".format(column_names))



# if __name__ == "__main__":
#     main()


