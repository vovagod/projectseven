from django.urls import path
from .views import ClientsActionView, ClientsPreorderView


app_name = 'clients'

urlpatterns = [
    path('preorder/<uuid>', ClientsPreorderView.as_view(), name='preorder'),
    path('<action>/<uuid>', ClientsActionView.as_view(), name='action'),
]
