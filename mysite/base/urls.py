from django.urls import path, re_path
from mysite.base import views
from mysite.base.views import (
    BaseView,
    #baseviewreverse,
    BaseRedirectView,
    )

app_name = 'base'

urlpatterns = [
    #path('', BaseView.as_view(), name='baseview'),
    path('', BaseRedirectView.as_view(), kwargs={'part':'h'}, name='home'),
    re_path(r'^about/$', BaseRedirectView.as_view(), name='about'),
    re_path(r'^technology/$', BaseView.as_view(), name='technology'),
    re_path(r'^specification/$', BaseView.as_view(), name='specification'),
    re_path(r'^application/$', BaseView.as_view(), name='application'),
    re_path(r'^success/$', BaseView.as_view(), name='success'),
    re_path(r'^contact/$', BaseView.as_view(), name='contact'),
]
