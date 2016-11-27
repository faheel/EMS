from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db import connection
from django.http import HttpResponseRedirect
from django.shortcuts import render
from .forms import LoginForm


# Utility functions -------------------------------------------------------------------------------
def dictfetchall(cursor):
	''' Return all rows from a cursor as a dict '''
	columns = [col[0] for col in cursor.description]
	return [
		dict(zip(columns, row))
		for row in cursor.fetchall()
	]

def dictfetchone(cursor):
	''' Return one row from a cursor as a dict '''
	columns = [col[0] for col in cursor.description]
	return dict(zip(columns, cursor.fetchone()))


# Login -------------------------------------------------------------------------------------------
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
	return render(request, 'main/login.html',
		{
			'login_form': login_form,
			'login_error': login_error,
		})


# Logout ------------------------------------------------------------------------------------------
def user_logout(request):
	logout(request)
	return HttpResponseRedirect('/')


# Homepage ----------------------------------------------------------------------------------------
def home(request):
	return render(request, 'main/base.html',
		{
			'page_title': 'Home',
		})


# Details -----------------------------------------------------------------------------------------
def details(request):
	if request.method == 'POST':
		form_type = request.POST['form_type']
		if form_type == 'student':
			with connection.cursor() as cursor:
				cursor.execute("SELECT * FROM main_department")
				departments = dictfetchall(cursor)
				semesters = list(range(1, 9))
			return render(request, 'main/details/form.html',
				{
					'page_title': 'Student details',
					'departments': departments,
					'semesters': semesters,
					'form_type': form_type,
				})
		elif form_type == 'teacher':
			with connection.cursor() as cursor:
				cursor.execute("SELECT * FROM main_department")
				departments = dictfetchall(cursor)
			return render(request, 'main/details/form.html',
				{
					'page_title': 'Teacher details',
					'departments': departments,
					'form_type': form_type,
				})
	else:
		form_type = 'select'
	return render(request, 'main/details/form.html',
		{
			'page_title': 'Details',
			'form_type': form_type,
		})

def details_students(request):
	''' View and edit details of students '''
	if request.method == 'POST':
		dept_name = request.POST['dept_name']
		semester = request.POST['semester']
		with connection.cursor() as cursor:
			cursor.execute("SELECT * FROM main_student WHERE semester = %s AND dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [semester, dept_name])
			students = dictfetchall(cursor)
	else:
		return HttpResponseRedirect('/details/')
	return render(request, 'main/details/table.html',
		{
			'page_title': 'Student details',
			'students': students,
			'dept_name': dept_name,
			'semester': semester,
		})

def details_teachers(request):
	''' View and edit details of teachers '''
	if request.method == 'POST':
		dept_name = request.POST['dept_name']
		with connection.cursor() as cursor:
			cursor.execute("SELECT * FROM main_teacher WHERE dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [dept_name])
			teachers = dictfetchall(cursor)
	else:
		return HttpResponseRedirect('/details/')
	return render(request, 'main/details/table.html',
		{
			'page_title': 'Teacher Details',
			'teachers': teachers,
			'dept_name': dept_name,
		})

def profile_student(request, student_id):
	if request.method == 'POST':
		student_id = request.POST['student_id']
		roll_no = request.POST['roll_no']
		name = request.POST['name']
		semester = request.POST['semester']
		dept_name = request.POST['dept_name']
		dob = request.POST['dob']
		with connection.cursor() as cursor:
			cursor.execute("UPDATE main_student SET roll_no = %s, name = %s, dob = %s, semester = %s, dept_id = (SELECT dept_id from main_department WHERE name = %s) WHERE student_id = %s;", [roll_no, name, dob, semester, dept_name, student_id])
			cursor.execute("SELECT * FROM main_student WHERE semester = %s AND dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [semester, dept_name])
			students = dictfetchall(cursor)
		return render(request, 'main/details/table.html',
			{
				'page_title': 'Student details',
				'students': students,
				'dept_name': dept_name,
				'semester': semester,
			})
	else:
		with connection.cursor() as cursor:
			cursor.execute("SELECT * FROM main_student WHERE student_id = %s", [student_id])
			student = dictfetchone(cursor)
			cursor.execute("SELECT name FROM main_department WHERE dept_id = %s", [student['dept_id']])
			dept_name = cursor.fetchone()
			cursor.execute("SELECT * FROM main_department")
			departments = dictfetchall(cursor)
			if request.user.is_authenticated():
				url = 'main/details/profile.html'
			else:
				url = 'main/details/view_profile.html'
		return render(request, url,
			{
				'page_title': 'Student Profile',
				'profile': student,
				'profile_type': 'student',
				'dept_name': ''.join(dept_name),
				'departments': departments,
			})

def profile_teacher(request, teacher_id):
	if request.method == 'POST':
		teacher_id = request.POST['teacher_id']
		name = request.POST['name']
		post = request.POST['post']
		salary = request.POST['salary']
		dept_name = request.POST['dept_name']
		teaching_since = request.POST['teaching_since']
		with connection.cursor() as cursor:
			cursor.execute("UPDATE main_teacher SET name = %s, dept_id = (SELECT dept_id from main_department WHERE name = %s), post = %s, teaching_since = %s, salary = %s WHERE teacher_id = %s;", [name, dept_name, post, teaching_since, salary, teacher_id])
			cursor.execute("SELECT * FROM main_teacher WHERE dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [dept_name])
			teachers = dictfetchall(cursor)
		return render(request, 'main/details/table.html',
			{
				'page_title': 'Teacher details',
				'teachers': teachers,
				'dept_name': dept_name,
			})
	else:
		with connection.cursor() as cursor:
			cursor.execute("SELECT * FROM main_teacher WHERE teacher_id = %s", [teacher_id])
			teacher = dictfetchone(cursor)
			cursor.execute("SELECT name FROM main_department WHERE dept_id = %s", [teacher['dept_id']])
			dept_name = cursor.fetchone()
			cursor.execute("SELECT * FROM main_department")
			departments = dictfetchall(cursor)
			if request.user.is_authenticated():
				url = 'main/details/profile.html'
			else:
				url = 'main/details/view_profile.html'
		return render(request, url,
			{
				'page_title': 'Teacher Profile',
				'profile': teacher,
				'profile_type': 'teacher',
				'dept_name': ''.join(dept_name),
				'departments': departments,
			})

@login_required
def add_student(request):
	if request.method == 'POST':
		student_id = request.POST['student_id']
		roll_no = request.POST['roll_no']
		name = request.POST['name']
		semester = request.POST['semester']
		dept_name = request.POST['dept_name']
		dob = request.POST['dob']
		with connection.cursor() as cursor:
			cursor.execute("INSERT INTO main_student VALUES (%s, %s, %s, %s, %s, (SELECT dept_id FROM main_department WHERE name = %s));", [student_id, roll_no, name, dob, semester, dept_name])
			cursor.execute("SELECT * FROM main_student WHERE semester = %s AND dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [semester, dept_name])
			students = dictfetchall(cursor)
		return render(request, 'main/details/table.html',
			{
				'page_title': 'Student details',
				'students': students,
				'dept_name': dept_name,
				'semester': semester,
			})
	else:
		with connection.cursor() as cursor:
			cursor.execute("SELECT * FROM main_department")
			departments = dictfetchall(cursor)
			semesters = list(range(1, 9))
		return render(request, 'main/details/profile.html',
			{
				'page_title': 'Add student',
				'action': 'add_student',
				'departments': departments,
				'semesters': semesters,
			})

@login_required
def add_teacher(request):
	if request.method == 'POST':
		teacher_id = request.POST['teacher_id']
		name = request.POST['name']
		dept_name = request.POST['dept_name']
		post = request.POST['post']
		salary = request.POST['salary']
		teaching_since = request.POST['teaching_since']
		with connection.cursor() as cursor:
			cursor.execute("INSERT INTO main_teacher (teacher_id, name, dept_id, post, salary, teaching_since) VALUES (%s, %s, (SELECT dept_id FROM main_department WHERE name = %s), %s, %s, %s);", [teacher_id, name, dept_name, post, salary, teaching_since])
			cursor.execute("SELECT * FROM main_teacher WHERE dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [dept_name])
			teachers = dictfetchall(cursor)
		return render(request, 'main/details/table.html',
			{
				'page_title': 'Teacher details',
				'teachers': teachers,
				'dept_name': dept_name,
			})
	else:
		with connection.cursor() as cursor:
			cursor.execute("SELECT * FROM main_department")
			departments = dictfetchall(cursor)
		return render(request, 'main/details/profile.html',
			{
				'page_title': 'Add teacher',
				'action': 'add_teacher',
				'departments': departments,
			})

@login_required
def delete_student(request):
	if request.method == 'POST':
		student_id = request.POST['student_id']
		semester = request.POST['semester']
		dept_name = request.POST['dept_name']
		with connection.cursor() as cursor:
			cursor.execute("DELETE FROM main_student WHERE student_id = %s", [student_id])
			cursor.execute("SELECT * FROM main_student WHERE semester = %s AND dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [semester, dept_name])
			students = dictfetchall(cursor)
		return render(request, 'main/details/table.html',
			{
				'page_title': 'Student details',
				'students': students,
				'dept_name': dept_name,
				'semester': semester,
			})
	else:
		return HttpResponseRedirect('/details/')

@login_required
def delete_teacher(request):
	if request.method == 'POST':
		teacher_id = request.POST['teacher_id']
		dept_name = request.POST['dept_name']
		with connection.cursor() as cursor:
			cursor.execute("DELETE FROM main_teaches WHERE teacher_id = %s", [teacher_id])
			cursor.execute("DELETE FROM main_teacher WHERE teacher_id = %s", [teacher_id])
			cursor.execute("SELECT * FROM main_teacher WHERE dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [dept_name])
			teachers = dictfetchall(cursor)
		return render(request, 'main/details/table.html',
			{
				'page_title': 'Teacher details',
				'teachers': teachers,
				'dept_name': dept_name,
			})
	else:
		return HttpResponseRedirect('/details/')

# Attendance --------------------------------------------------------------------------------------
def attendance(request):
	with connection.cursor() as cursor:
		cursor.execute("SELECT * FROM main_department")
		departments = dictfetchall(cursor)
		semesters = list(range(1, 9))
	return render(request, 'main/attendance/form.html',
		{
			'page_title': 'Attendance',
			'departments': departments,
			'semesters': semesters,
		})

def attendance_list(request):
	''' View attendance of students '''
	if request.method == 'POST':
		semester = request.POST['semester']
		dept_name = request.POST['dept_name']
		with connection.cursor() as cursor:
			cursor.execute("SELECT * FROM main_student WHERE semester = %s AND dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [semester, dept_name])
			students = dictfetchall(cursor)
			cursor.execute("SELECT name FROM main_subject WHERE semester = %s AND dept_id = (SELECT dept_id FROM main_department WHERE name = %s) ORDER BY subject_id", [semester, dept_name])
			subject_names = dictfetchall(cursor)
			attendance_list = []
			avg_list = []
			for student in students:
				cursor.execute("SELECT student_id, attendance FROM main_classattendance WHERE student_id = %s ORDER BY subject_id", [student['student_id']])
				attendance = dictfetchall(cursor)
				attendance_list += attendance
				cursor.execute("SELECT student_id, AVG(attendance) AS 'avg' FROM main_classattendance WHERE student_id = %s GROUP BY student_id", [student['student_id']])
				avg = dictfetchall(cursor)
				avg_list += avg
		return render(request, 'main/attendance/table.html',
			{
				'page_title': 'Attendance',
				'students': students,
				'subject_names': subject_names,
				'attendance_list': attendance_list,
				'avg_list': avg_list,
				'dept_name': dept_name,
				'semester': semester,
			})
	else:
		return HttpResponseRedirect('/results/')

# Results -----------------------------------------------------------------------------------------
def results(request):
	with connection.cursor() as cursor:
		cursor.execute("SELECT * FROM main_department")
		departments = dictfetchall(cursor)
		semesters = list(range(1, 9))
	return render(request, 'main/results/form.html',
		{
			'page_title': 'Results',
			'departments': departments,
			'semesters': semesters,
		})

def results_list(request):
	''' View results of students '''
	if request.method == 'POST':
		semester = request.POST['semester']
		dept_name = request.POST['dept_name']
		with connection.cursor() as cursor:
			cursor.execute("SELECT * FROM main_student WHERE semester = %s AND dept_id = (SELECT dept_id FROM main_department WHERE name = %s)", [semester, dept_name])
			students = dictfetchall(cursor)
			cursor.execute("SELECT name FROM main_subject WHERE semester = %s AND dept_id = (SELECT dept_id FROM main_department WHERE name = %s) ORDER BY subject_id", [semester, dept_name])
			subject_names = dictfetchall(cursor)
			results_list = []
			avg_list = []
			for student in students:
				cursor.execute("SELECT student_id, marks FROM main_marks WHERE student_id = %s ORDER BY subject_id", [student['student_id']])
				marks = dictfetchall(cursor)
				results_list += marks
				cursor.execute("SELECT student_id, AVG(marks) AS 'avg' FROM main_marks WHERE student_id = %s GROUP BY student_id", [student['student_id']])
				avg = dictfetchall(cursor)
				avg_list += avg

		return render(request, 'main/results/table.html',
			{
				'page_title': 'Results',
				'students': students,
				'subject_names': subject_names,
				'results_list': results_list,
				'avg_list': avg_list,
				'dept_name': dept_name,
				'semester': semester,
			})
	else:
		return HttpResponseRedirect('/results/')

# Schedule ----------------------------------------------------------------------------------------
def schedule_view(request):
	return render(request, 'main/schedule.html',
		{
			'page_title': 'Schedule',
		})

@login_required
def schedule_edit(request, dept_id, semester):
	return render(request, 'main/schedule.html',
		{
			'page_title': 'Edit Schedule',
		})


# Notifications -----------------------------------------------------------------------------------
def notifications_view(request):
	return render(request, 'main/notifications.html',
		{
			'page_title': 'Notifications',
		})
