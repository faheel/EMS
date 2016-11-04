from django.contrib import admin
from .models import *


main_models = [
    admins,
    department,
    hod,
    teacher,
    subject,
    subject_section,
    teacher_subject,
    student,
    student_section,
    class_attendance,
    exam_attendance,
    exam_schedule,
    paper_coding,
    marks,
]

admin.site.register(main_models)
