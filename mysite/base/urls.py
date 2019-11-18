from django.urls import path, re_path
from mysite.base.views import (
    BaseView,
    BaseRedirectView,
    )

app_name = 'base'

urlpatterns = [
    path('', BaseView.as_view(), name='baseview'),
    re_path(r'^about/$', BaseRedirectView.as_view(), kwargs={'part':'about'}, name='about'),
    re_path(r'^technology/$', BaseRedirectView.as_view(), kwargs={'part':'technology'}, name='technology'),
    re_path(r'^specification/$', BaseRedirectView.as_view(), kwargs={'part':'specification'}, name='specification'),
    re_path(r'^application/$', BaseRedirectView.as_view(), kwargs={'part':'application'}, name='application'),
    re_path(r'^success/$', BaseRedirectView.as_view(), kwargs={'part':'success'}, name='success'),
    re_path(r'^contact/$', BaseRedirectView.as_view(), kwargs={'part':'contact'}, name='contact'),
]
