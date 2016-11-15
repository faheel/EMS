from django.conf.urls import url
from . import views


urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^login/$', views.user_login, name='login'),
    url(r'^logout/$', views.user_logout, name='logout'),
    url(r'^details/$', views.details, name='details'),
    url(r'^attendance/$', views.attendance, name='attendance'),
    url(r'^results/$', views.results, name='results'),
    url(r'^schedule/$', views.schedule, name='schedule'),
    url(r'^notifications/$', views.notifications, name='notifications'),
]
