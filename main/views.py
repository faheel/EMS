from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db import connection
from django.http import HttpResponseRedirect
from django.shortcuts import render
from .forms import LoginForm


# Login
def user_login(request):
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(request.GET.get('next', '/'))
        else:
            login_error = True
    else:
        login_form = LoginForm()
        login_error = False

    return render(request, 'main/login.html', {'login_form': login_form, 'login_error': login_error})


# Logout
def user_logout(request):
    logout(request)
    return HttpResponseRedirect('/')


# Homepage
def home(request):
    return render(request, 'main/base.html', {'page_title': 'Home'})


# Details
def details(request):
    return render(request, 'main/details/details.html', {'page_title': 'Details'})


def details_students(request, dept_id, semester):      # view and edit details of students
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM main_student WHERE dept_id = %s AND semester = %s", [dept_id, semester])
        students = cursor.fetchall()

    return render(request, 'main/details_view.html', {'page_title': 'Student Details', 'students': students})


def details_teachers(request, dept_id):      # view and edit details of teachers
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM main_student WHERE dept_id = %s", [dept_id])
        teachers = cursor.fetchall()

    return render(request, 'main/details_view.html', {'page_title': 'Teacher Details', 'teachers': teachers})


def profile_student(request, student_id):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM main_student WHERE student_id = %s", [student_id])
        student = cursor.fetchone()

    return render(request, 'main/details/profile.html', {'page_title': 'Student Profile', 'student': student, 'profile_type': 'student'})


def profile_teacher(request, teacher_id):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM main_teacher WHERE teacher_id = %s", [teacher_id])
        teacher = cursor.fetchone()

    return render(request, 'main/details/profile.html', {'page_title': 'Teacher Profile', 'teacher': teacher, 'profile_type': 'teacher'})


# Attendance
def attendance(request):
    return render(request, 'main/attendance.html', {'page_title': 'Attendance'})


@login_required
def attendance_edit(request, dept_id, semester):
    return render(request, 'main/attendance.html', {'page_title': 'Edit Attendance'})


# Results
def results_view(request):
    return render(request, 'main/results.html', {'page_title': 'Results'})

@login_required
def results_edit(request, dept_id, semester):
    return render(request, 'main/results.html', {'page_title': 'Edit Results'})


# Schedule
def schedule_view(request):
    return render(request, 'main/schedule.html', {'page_title': 'Schedule'})


@login_required
def schedule_edit(request, dept_id, semester):
    return render(request, 'main/schedule.html', {'page_title': 'Edit Schedule'})


# Notifications
def notifications_view(request):
    return render(request, 'main/notifications.html', {'page_title': 'Notifications'})
