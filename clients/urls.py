from django.urls import path
from .views import ClientsActionView


app_name = 'clients'

urlpatterns = [
    path('<action>/<uuid>', ClientsActionView.as_view(), name='clientsview'),
]
