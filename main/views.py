from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render
from .forms import LoginForm


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

def user_logout(request):
    logout(request)
    return HttpResponseRedirect('/')

def home(request):
    return render(request, 'main/base.html', {'page_title': 'Home'})

@login_required
def details(request):
    return render(request, 'main/details.html', {'page_title': 'Details'})

def attendance(request):
    return render(request, 'main/attendance.html', {'page_title': 'Attendance'})

def results(request):
    return render(request, 'main/results.html', {'page_title': 'Results'})

def schedule(request):
    return render(request, 'main/schedule.html', {'page_title': 'Schedule'})

def notifications(request):
    return render(request, 'main/notifications.html', {'page_title': 'Notifications'})
