from django.conf.urls import url
from . import views


urlpatterns = [
	url(r'^$', views.home, name='home'),
	url(r'^login/$', views.user_login, name='login'),
	url(r'^logout/$', views.user_logout, name='logout'),

	url(r'^details/$', views.details, name='details'),
	url(r'^details/students/$', views.details_students, name='details_students'),
	url(r'^details/teachers/$', views.details_teachers, name='details_teachers'),
	url(r'^profile/student/add/$', views.add_student, name='add_student'),
	url(r'^profile/teacher/add/$', views.add_teacher, name='add_teacher'),
	url(r'^profile/delete/student/$', views.delete_student, name='delete_student'),
	url(r'^profile/delete/teacher/$', views.delete_teacher, name='delete_teacher'),
	url(r'^profile/student/(?P<student_id>\S+)/$', views.profile_student, name='profile_student'),
	url(r'^profile/teacher/(?P<teacher_id>\S+)/$', views.profile_teacher, name='profile_teacher'),

	url(r'^attendance/$', views.attendance, name='attendance'),
	url(r'^attendance/list/$', views.attendance_list, name='attendance_list'),

	url(r'^results/$', views.results, name='results_view'),
	url(r'^results/list/$', views.results_list, name='results_list'),

	url(r'^schedule/$', views.schedule_view, name='schedule_view'),

	url(r'^notifications/$', views.notifications_view, name='notifications_view'),
]
