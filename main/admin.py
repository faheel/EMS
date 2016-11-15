from django.contrib import admin
from .models import *


main_models = [
    Department,
    Teacher,
    Student,
    StudentSection,
    Subject,
    SubjectSection,
    Teaches,
    ClassAttendance,
    Marks,
    Schedule,
]

admin.site.register(main_models)
