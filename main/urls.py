from django.conf.urls import url
from . import views


urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^login/$', views.user_login, name='login'),
    url(r'^logout/$', views.user_logout, name='logout'),
    url(r'^details/$', views.details, name='details'),
    url(r'^details/profile/student/(?P<student_id>\d+)/$', views.profile_student, name='profile_student'),
    url(r'^details/profile/teacher/(?P<teacher_id>\w{2}_\d{2})/$', views.profile_teacher, name='profile_teacher'),
    url(r'^attendance/$', views.attendance, name='attendance'),
    url(r'^results/$', views.results_view, name='results_view'),
    url(r'^schedule/$', views.schedule_view, name='schedule_view'),
    url(r'^notifications/$', views.notifications_view, name='notifications_view'),
]
