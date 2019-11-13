from django.urls import path
from mysite.base import views
from mysite.base.views import (
    BaseView,
    baseviewreverse,
    )

app_name = 'base'

urlpatterns = [
    path('', BaseView.as_view(), name='baseview'),
]
